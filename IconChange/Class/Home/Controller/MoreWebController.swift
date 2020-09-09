//
//  MoreWebController.swift
//  IconChange
//
//  Created by 2020 on 2020/9/5.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
fileprivate let kItemMarin : CGFloat = 10
fileprivate let kItemW : CGFloat = (kScreenW - 5 * kItemMarin) / 4
fileprivate let kMoreCellId : String = "kMoreCellId"


protocol MoreWebControllerClickDelegate: class {
    func selectedImgBack(imgModel : MoreImgModel)
}

class MoreWebController: UIViewController {
    weak var moreWebDelegate : MoreWebControllerClickDelegate?
    private lazy var moreImgVM : MoreImgViewModel = MoreImgViewModel()
    private lazy var collectionView : UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemW + 40)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMarin
//        layout.headerReferenceSize = CGSize(width: kScreenW, height: 10)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMarin, bottom: 0, right: kItemMarin)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
         collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        collectionView.register(UINib(nibName: "MoreImgCell", bundle: nil), forCellWithReuseIdentifier: kMoreCellId)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView

    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadData()
   
    }

}
extension MoreWebController {
    fileprivate func setUpUI() {
        title = "图标包"
        view.addSubview(collectionView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action:#selector(self.backClick))
//            collectionView.contentInset = UIEdgeInsets(top: kCycleH + kGameH, left: 0, bottom: 0, right: 0)
    }
}

extension MoreWebController {
    fileprivate func loadData() {
        moreImgVM.requestDate {
            self.collectionView.reloadData()
        }
        
    }
}
//MARK: ------- UICollectionView 代理
extension MoreWebController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moreImgVM.PicsModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imgModel = moreImgVM.PicsModels[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kMoreCellId, for: indexPath) as! MoreImgCell
        cell.imgModel = imgModel
        return cell
    }
}

//MARK: ------- UICollectionView UICollectionViewDelegate
extension MoreWebController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let picModel = moreImgVM.PicsModels[indexPath.item]
        moreWebDelegate?.selectedImgBack(imgModel: picModel)
        navigationController?.popViewController(animated: true)
    }
   
}


extension MoreWebController {
    @objc fileprivate func backClick() {
        navigationController?.popViewController(animated: true)
    }
}
