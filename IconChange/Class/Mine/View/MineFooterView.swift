//
//  MineFooterView.swift
//  IconChange
//
//  Created by 2020 on 2020/9/4.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

class MineFooterView: UIView {
//MARK: ------- 属性
     private lazy var companyLab : UILabel = {
           let label = UILabel()
           label.text = "北京智数信通科技有限公司 版权所有"
           label.font = UIFont.systemFont(ofSize: 14)
           label.textColor = UIColor.black
           return label
       }()
       private lazy var copyrightLab : UILabel = {
           let label = UILabel()
          label.text = "Copyright 2019-2020 All Rights Reserved"
          label.font = UIFont.systemFont(ofSize: 14)
          label.textColor = UIColor.lightGray
          return label
       }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        backgroundColor = UIColor.clear
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        companyLab.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-10)
        }
   
        copyrightLab.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(10)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: ------- 设置ui
extension MineFooterView {
    fileprivate func setUpUI() {
        addSubview(companyLab)
        addSubview(copyrightLab)
    }
}
