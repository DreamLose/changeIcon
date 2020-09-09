//
//  AppListCell.swift
//  IconChange
//
//  Created by 2020 on 2020/9/7.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

class AppListCell: UITableViewCell {

    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var iconName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
