//
//  MineController.swift
//  IconChange
//
//  Created by 2020 on 2020/9/3.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
let funcCellId : String = "funcCellId"
class MineController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataSource : [[String : Any]] = {
        let data = [["title": "帮助文档","icon": "ic_help"],
                    ["title": "官方抖音","icon": "ic_tik_tok"],
                    ["title": "官方快手","icon": "ic_kwai"],
                    ["title": "官方微博","icon": "ic_sina"],
                    ["title": "意见反馈","icon": "ic_feedback"],
                    ["title": "联系我们","icon": "ic_contact_us"],
                    ["title": "隐私政策","icon": "ic_privacy_policy"],
                    
        ]
        return data
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.apply(gradient: [UIColor(hexString: "#7F88E2"),UIColor(hexString: "#D774A3")])
        setTabViewDate()
        
  
    }
    
}

//MARK: ------- 设置tabview 参数
extension MineController {
    fileprivate func setTabViewDate() {
        tableView.register(UINib(nibName: "FuncTableCell", bundle: nil), forCellReuseIdentifier: funcCellId)
//        tableView.estimatedRowHeight = 50 * 7
        tableView.rowHeight = 50 * 7

        tableView.tableHeaderView = MineHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 130))
        let foot = UIView()
        foot.backgroundColor = UIColor.red
        foot.frame = CGRect(x: 0, y: 0, width: kScreenW, height: 50)
        tableView.tableFooterView = MineFooterView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 60))
    
      
    }

}
   //MARK: ------- dataSourceDelegate
extension MineController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: funcCellId) as! FuncTableCell
        cell.dataSource = dataSource
        return cell
    }
    
    
}


