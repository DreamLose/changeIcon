//
//  AppListController.swift
//  IconChange
//
//  Created by 2020 on 2020/9/4.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
fileprivate let resuseID : String = "AppListCellID"
protocol clickAppDelegate: class {
    func chooseAppBack(appInfo:[String : String])
}
class AppListController: UITableViewController {
    weak var clickDelegate :clickAppDelegate?
    
    fileprivate lazy var dataSource : [[String : [Any]]] = {
        let appList = NSArray(contentsOfFile: Bundle.main.path(forResource: "AppList", ofType: "plist")!)!
        return appList as! [[String : [Any]]]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "选择应用"
        tableView.register(UINib(nibName: "AppListCell", bundle: nil), forCellReuseIdentifier: resuseID)
        tableView.sectionIndexBackgroundColor = UIColor.white
        tableView.sectionIndexTrackingBackgroundColor = UIColor.white
        tableView.rowHeight = 50
         navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action:#selector(self.backClick))
      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].first?.value.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: resuseID, for: indexPath) as! AppListCell
        
        let dictArr = dataSource[indexPath.section].first?.value
        cell.iconName.text = (dictArr?[indexPath.row] as? Dictionary)?["title"]
        cell.iconImg.image = UIImage(named: (dictArr?[indexPath.row] as? Dictionary)?["icon_url"] ?? "")
        cell.selectionStyle = .none
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource[section].first?.key
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: kScreenW, height: 70)
        view.backgroundColor = UIColor.white
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 0, width: kScreenW, height: 20)
        label.text = dataSource[section].first?.key
        label.textColor = UIColor.black
        
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dictArr = dataSource[indexPath.section].first?.value
        guard let dic = dictArr?[indexPath.row] as? [String : String] else {
            return
        }
        clickDelegate?.chooseAppBack(appInfo: dic)
        navigationController?.popViewController(animated: true)
        
    }
}

//MARK: -------  索引
extension AppListController {
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var indexArr : [String] = [String]()
        for dic in dataSource {
            guard let key = dic.keys.first else {
                continue
            }
            indexArr.append(key)
        }
        return indexArr
    }
}

extension AppListController {
    @objc fileprivate func backClick() {
        navigationController?.popViewController(animated: true)
    }
}
