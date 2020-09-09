//
//  PresentationController.swift
//  IconChange
//
//  Created by 2020 on 2020/9/4.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    //MARK: ------- 对外提供属性修改
    var presetedFrame : CGRect = CGRect.zero
    //MARK: ------- 懒加载蒙版
    fileprivate lazy var coverView : UIView = UIView()
//    布局 修改控制器的大小
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        //设置弹出view的尺寸
        presentedView?.frame = presetedFrame
//        添加蒙版
        setupCoverView()
    }
}

//MARK: ------- 设置UI
extension PresentationController {
    //设置蒙版
    fileprivate func setupCoverView() {
//        containerView?.addSubview(coverView)
        containerView?.insertSubview(coverView, at: 0)
//        设置蒙版属性
        coverView.backgroundColor = UIColor(white: 0.8, alpha: 0.5)
        coverView.frame = containerView?.bounds ?? CGRect.zero

        //添加手势
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.coverViewClick))
        coverView.addGestureRecognizer(tapGes)
    }
}
extension PresentationController {
    //消除弹出试图
    @objc fileprivate func coverViewClick() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
