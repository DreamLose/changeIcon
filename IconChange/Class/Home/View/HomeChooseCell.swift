//
//  HomeChooseCell.swift
//  IconChange
//
//  Created by 2020 on 2020/9/4.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
protocol chooseClickDelegate: class {
    func chooseAppOrIcon(tag:Int)
}
class HomeChooseCell: UITableViewCell {
    weak var chooseDelegate :chooseClickDelegate?
    
    
    @IBOutlet weak var appIconView: UIImageView! 
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var chooseAppView: UIView!
    @IBOutlet weak var chooseIconView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.clickAddApp(tab:)))
        chooseAppView.addGestureRecognizer(tapGes)
        let tapNameGes = UITapGestureRecognizer(target: self, action: #selector(self.clickAddApp(tab:)))
        chooseIconView.addGestureRecognizer(tapNameGes)
    }
}
extension HomeChooseCell {
    @objc fileprivate func clickAddApp(tab : UITapGestureRecognizer) {
        guard let tabView = tab.view else {
            return
        }
        chooseDelegate?.chooseAppOrIcon(tag: tabView.tag)
    }
   
}
