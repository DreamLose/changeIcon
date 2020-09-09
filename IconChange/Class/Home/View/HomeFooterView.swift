//
//  HomeFooterView.swift
//  IconChange
//
//  Created by 2020 on 2020/9/4.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

class HomeFooterView: UIView {
    private lazy var footBigImg : UIImageView = {
        let bigImg = UIImageView()
        bigImg.image = UIImage(named: "defaultFooterImg")
        bigImg.layer.cornerRadius = 10
        bigImg.layer.masksToBounds = true
        return bigImg
  }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(footBigImg)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        footBigImg.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20,left: 20,bottom: 20,right: 20))
        }
    }
}
