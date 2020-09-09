//
//  PopViewController.swift
//  IconChange
//
//  Created by 2020 on 2020/9/4.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

class PopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
//        view.backgroundColor = UIColor.red
       
    }


    @IBAction func konwBtnClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
