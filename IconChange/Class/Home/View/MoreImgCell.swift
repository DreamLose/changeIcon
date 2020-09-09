//
//  MoreImgCell.swift
//  IconChange
//
//  Created by 2020 on 2020/9/5.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

class MoreImgCell: UICollectionViewCell {
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var imgName: UILabel!
    
    var imgModel : MoreImgModel? {
        didSet {
            imgIcon.image = UIImage(named: imgModel?.pic_url ?? "")
            imgName.text = imgModel?.pic_name
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
