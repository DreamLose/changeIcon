//
//  MineHeaderView.swift
//  IconChange
//
//  Created by 2020 on 2020/9/3.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
import SnapKit

class MineHeaderView: UIView {
    //MARK: ------- 属性
    private lazy var imageIcon : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = UIColor.green
        imgView.layer.cornerRadius = 48
        imgView.layer.masksToBounds = true
        return imgView
    }()
    private lazy var appNameLab : UILabel = {
        let label = UILabel()
        label.text = "换图标"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        return label
    }()
    private lazy var versionLab : UILabel = {
        let label = UILabel()
       label.text = "版本:1.1.1"
       label.font = UIFont.systemFont(ofSize: 14)
       label.textColor = UIColor.lightGray
       return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageIcon.snp.makeConstraints { (make) in
            make.size.equalTo(96)
            make.centerX.equalToSuperview().offset(-48)
            make.top.equalToSuperview().offset(16)
        }
        appNameLab.snp.makeConstraints { (make) in
            make.centerY.equalTo(imageIcon).offset(-15)
            make.left.equalTo(imageIcon.snp_rightMargin).offset(20)
        }
        versionLab.snp.makeConstraints { (make) in
             make.centerY.equalTo(imageIcon).offset(15)
            make.left.equalTo(appNameLab.snp_leftMargin)
        }
    }
}

//MARK: ------- 布局
extension MineHeaderView {
    fileprivate func setUpUI() {
        addSubview(imageIcon)
        addSubview(appNameLab)
        addSubview(versionLab)
    }
}

