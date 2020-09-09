//
//  MoreImgModel.swift
//  IconChange
//
//  Created by 2020 on 2020/9/5.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

class MoreImgModel: NSObject {
    @objc var pic_name : String = ""
    @objc var pic_url :String = ""
    
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
