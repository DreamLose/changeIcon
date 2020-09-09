//
//  HomeController.swift
//  IconChange
//
//  Created by 2020 on 2020/9/4.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
import Swifter
import Photos
import MBProgressHUD

fileprivate let HomeChooseCellID : String = "HomeChooseCellID"
fileprivate let HomeAddNameCellID : String = "HomeAddNameCellID"
class HomeController: UITableViewController {
    lazy var server = HttpServer()
    fileprivate lazy var popoverAnimation : PoperAnimator = PoperAnimator()
    var changeAppInfo : [String : Any] = [String : Any]()
    
    
    //MARK: ------- 系统函数
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationController?.navigationBar.apply(gradient: [UIColor(hexString: "#7F88E2"),UIColor(hexString: "#D774A3")])
        registerCell()
        addNavTipBtn()
       
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: HomeChooseCellID, for: indexPath)
            (cell as! HomeChooseCell).chooseDelegate = self
        }else {
            cell = tableView.dequeueReusableCell(withIdentifier: HomeAddNameCellID, for: indexPath)
            (cell as! HomeAddNameCell).homeAddDelegate = self
        }
         return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        } else {
            return 180
        }
    }
}

//MARK: ------- 注册Cell,添加导航栏按钮
extension HomeController {
//    注册cell
    fileprivate func registerCell(){
        tableView.register(UINib(nibName: "HomeChooseCell", bundle: nil), forCellReuseIdentifier: HomeChooseCellID)
        tableView.register(UINib(nibName: "HomeAddNameCell", bundle: nil), forCellReuseIdentifier: HomeAddNameCellID)
        tableView.tableFooterView = HomeFooterView(frame: CGRect(x: 0, y: 0, width: kScreenW - 40, height: 300))
    }
//    添加导航栏按钮
    fileprivate func addNavTipBtn() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "tips")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action:#selector(self.navBtnClick))
     
    }
}
//MARK: -------导航栏按钮点击, 创建弹出试图
extension HomeController {
    @objc fileprivate func navBtnClick() {
        let poperView = PopViewController()
        poperView.modalPresentationStyle = .custom
        poperView.transitioningDelegate = popoverAnimation
        popoverAnimation.presentedFrame = CGRect(x: 40, y: view.center.y - 150, width: kScreenW - 80, height: 280)
        present(poperView, animated: true, completion: nil)
        
    }
}

//MARK: ------- HomeChoosecell 代理
extension HomeController : chooseClickDelegate {
    func chooseAppOrIcon(tag: Int) {
        if tag == 100 {
            let appList = AppListController()
            appList.clickDelegate = self
            navigationController?.pushViewController(appList, animated: true)
        } else {
            
//            let chooseView = ChooseSourceController()
//            chooseView.modalPresentationStyle = .custom
//            chooseView.transitioningDelegate = popoverAnimation
//            popoverAnimation.presentedFrame = CGRect(x: 0, y: kScreenH - 140, width: kScreenW, height: 140)
//            present(chooseView, animated: true, completion: nil)
            
            let alertController = UIAlertController(title: "图标分类", message: nil, preferredStyle: .actionSheet)
            let cancel = UIAlertAction(title: "取消", style: .default, handler: nil)
            let localPhoto = UIAlertAction(title:"相册", style: .default){ action in
                self.goImage()
            }
            let moreIcon = UIAlertAction(title:"图标包", style: .default){ action in
                self.goImageWebMore()
            }
            alertController.addAction(cancel)
            alertController.addAction(localPhoto)
            alertController.addAction(moreIcon)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
}
//MARK: ------- 选择程序 代理
extension HomeController : clickAppDelegate {
    func chooseAppBack(appInfo: [String : String]) {
        let cell = tableView.cellForRow(at: IndexPath(item: 0, section: 0)) as! HomeChooseCell
        cell.appImageView.image = UIImage(named: appInfo["icon_url"] ?? "")
        let addCell = tableView.cellForRow(at: IndexPath(item: 1, section: 0)) as! HomeAddNameCell
        addCell.textField.text = appInfo["title"]
        changeAppInfo["url"] = appInfo["url"]
//        changeAppInfo["name"] = appInfo["title"]
        tableView.reloadData()
    }
}


//MARK: ------- 调取系统相册 or 网络图标
extension HomeController {
//    调取系统相册
    fileprivate func goImage() {
        let photoPicker =  UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
        //在需要的地方present出来
        if canUseCameral() {
            photoPicker.sourceType = .photoLibrary
            photoPicker.modalPresentationStyle = .custom
            self.present(photoPicker, animated: true, completion: nil)
        }else {
            let alertController = UIAlertController(title: "提示", message: "应用相册权限受限,请在设置中启用", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "确定", style: .cancel, handler: nil)
            alertController.addAction(cancel)
            present(alertController, animated: true, completion: nil)
        }
       
    }
    //判断相册权限
    fileprivate func canUseCameral() -> Bool {
        let authStatus = PHPhotoLibrary.authorizationStatus()
        return authStatus != .restricted && authStatus != .denied
    }
    
    
    
//    获取网络图片
    fileprivate func goImageWebMore() {
        let moreWeb = MoreWebController()
        moreWeb.moreWebDelegate = self
        navigationController?.pushViewController(moreWeb, animated: true)
    }
}
//MARK: ------- 加载更多图标代理
extension HomeController : MoreWebControllerClickDelegate {
    func selectedImgBack(imgModel: MoreImgModel) {
        let seletedImg = UIImage(named: imgModel.pic_url)
        self.changeAppInfo["appIcon"] = seletedImg
        let cell = self.tableView.cellForRow(at: IndexPath(item: 0, section: 0)) as! HomeChooseCell
        cell.appIconView.image = seletedImg
        self.tableView.reloadData()
    }
    
    
}
//MARK: -------  系统相册代理
extension HomeController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("取消了选择")
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("选择了")
        let editeImage = info[.editedImage]
        picker.dismiss(animated: true) {
            let cell = self.tableView.cellForRow(at: IndexPath(item: 0, section: 0)) as! HomeChooseCell
            cell.appIconView.image = editeImage as? UIImage
            self.changeAppInfo["appIcon"] = editeImage
            self.tableView.reloadData()
        }
    }
}


//MARK: ------- 确定替换代理
extension HomeController : HomeAddNameCellChangeDelegate {
    func clickChange(changeName: String) {
        guard changeAppInfo["url"] != nil  else {
            print("请选择应用")
            let alertController = UIAlertController(title: "提示", message: "请选择应用", preferredStyle: .alert)
           let cancel = UIAlertAction(title: "知道了", style: .destructive, handler: nil)
           alertController.addAction(cancel)
           present(alertController, animated: true, completion: nil)
            return
        }
        guard changeAppInfo["appIcon"] != nil  else {
            let alertController = UIAlertController(title:"提示", message: "请选择图标", preferredStyle: .alert)
          let cancel = UIAlertAction(title: "知道了", style: .destructive, handler: nil)
          alertController.addAction(cancel)
          present(alertController, animated: true, completion: nil)
            print("请选择图标")
            return
        }
        guard let deeplink = URL(string: changeAppInfo["url"] as! String) else {
           return
       }

//    随机端口号
        let max: UInt32 = 60000
        let min: UInt32 = 50000
        let rand = Int(arc4random_uniform(max - min) + min)
        let portNum = 8244
       guard let shortcutUrl = URL(string: "http://localhost:\(portNum)/s?ranparam=\(rand)") else {
           return
       }
       
        guard let iconData = (changeAppInfo["appIcon"] as? UIImage)?.jpegData(compressionQuality: 0.5) else {
           return
       }
       let html = htmlFor(title: changeName, urlToRedirect: deeplink.absoluteString, icon: iconData.base64EncodedString())
       
       guard let base64 = html.data(using: .utf8)?.base64EncodedString() else {
           return
       }
       server["/s"] = { request in
           return .movedTemporarily("data:text/html;base64,\(base64)")
       }
        try? server.start(in_port_t(portNum))
       UIApplication.shared.open(shortcutUrl)
    }
    func htmlFor(title: String, urlToRedirect: String, icon: String) -> String {
        let shortcutsPath = Bundle.main.path(forResource: "shortcuts", ofType: "html")
        
        var shortcutsContent = try! String(contentsOfFile: shortcutsPath!) as String
        shortcutsContent = shortcutsContent.replacingOccurrences(of: "\\(title)", with: title)
    //        shortcutsContent = shortcutsContent.replacingOccurrences(of: "\\(urlToRedirect.absoluteString)", with: urlToRedirect)
         shortcutsContent = shortcutsContent.replacingOccurrences(of: "\\(urlToRedirect.absoluteString)", with: urlToRedirect)
        
        shortcutsContent = shortcutsContent.replacingOccurrences(of: "\\(feature_icon)", with: icon)
        return shortcutsContent
    }
    
}
