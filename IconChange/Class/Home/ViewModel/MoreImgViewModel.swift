//
//  MoreImgViewModel.swift
//  IconChange
//
//  Created by 2020 on 2020/9/5.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

class MoreImgViewModel {
     lazy var PicsModels : [MoreImgModel] = [MoreImgModel]()
}

extension MoreImgViewModel {
    func requestDate(finshedCallBack : @escaping() -> ()) {
        guard let moreImgList = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "MoreImg", ofType: "plist") ?? "") else {
            return
        }
        guard let resultArr = moreImgList["pics"] as? [[String : NSObject]] else { return }
        for dic in resultArr {
          let picModel = MoreImgModel(dict: dic)
          self.PicsModels.append(picModel)
        }
        finshedCallBack()
    }
}
