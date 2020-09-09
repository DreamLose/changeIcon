//
//  HomeAddNameCell.swift
//  IconChange
//
//  Created by 2020 on 2020/9/4.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
import Swifter

protocol HomeAddNameCellChangeDelegate: class {
    func clickChange(changeName : String)
}

class HomeAddNameCell: UITableViewCell {
    weak var homeAddDelegate : HomeAddNameCellChangeDelegate?
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var changeBtn: UIButton! {
        didSet {
            let gradientLayer =  CAGradientLayer()
            gradientLayer.frame = CGRect(x: 0, y: 0, width: changeBtn.frame.width, height: changeBtn.frame.height)
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
            gradientLayer.locations = [0.5,1.0]
            gradientLayer.colors = [UIColor(hexString: "#F2CBAE").cgColor,UIColor(hexString: "#F4768C").cgColor]
//            changeBtn.setTitle("确定替换", for: <#T##UIControl.State#>)
            changeBtn.layer.addSublayer(gradientLayer)
        }
    }
    @IBOutlet weak var clearBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    @IBAction func clickChange(_ sender: Any) {
        homeAddDelegate?.clickChange(changeName: textField.text ?? "")
    }
    @IBAction func clearBtnClick(_ sender: Any) {
        textField.text = ""
    }
}

extension HomeAddNameCell : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //收起键盘
        textField.resignFirstResponder()
        //打印出文本框中的值
        return true;
    }
}
