//
//  FuncTableCell.swift
//  IconChange
//
//  Created by 2020 on 2020/9/3.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
let systemCell : String = "systemCell"

class FuncTableCell: UITableViewCell {
    var dataSource : [[String : Any]]? {
        didSet {
            funcTabView.reloadData()
        }
    }
    
    //MARK: ------- 系统函数
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var funcTabView: UITableView!
}

//MARK: ------- 数据代理
extension FuncTableCell : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: systemCell)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: systemCell)
        }
      
        cell?.textLabel?.text = dataSource?[indexPath.row]["title"] as? String
        cell?.imageView?.image = UIImage(named:( dataSource?[indexPath.row]["icon"] as? String ?? ""))
        cell?.accessoryType = .disclosureIndicator
        cell?.selectionStyle = .none
        return cell!
    }
    
    
}
//MARK: ------- 点击代理
extension FuncTableCell : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了第\(indexPath.row)行")
    }
}
