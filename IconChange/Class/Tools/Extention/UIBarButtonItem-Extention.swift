//
//  UIBarButtonItem-Extention.swift
//  IconChange
//
//  Created by 2020 on 2020/9/4.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
extension UIBarButtonItem {
    convenience init(image:String,heightImg:String = "") {
        let btn = UIButton()
        btn.setImage(UIImage(named: image), for: .normal)
        if heightImg == "" {
            btn.setImage(UIImage(named: image + "_highlighted"), for: .highlighted)
        }else {
             btn.setImage(UIImage(named: heightImg), for: .highlighted)
        }
        
        btn.sizeToFit()
        self.init(customView:btn)
//        self.customView = btn
    }
}
