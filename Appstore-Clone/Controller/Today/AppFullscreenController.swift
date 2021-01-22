//
//  AppFullscreenController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 12/26/20.
//

import UIKit

class AppFullscreenController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    let cellID = "tb1"
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.item == 0) {
            let cell = UITableViewCell()
            let todayCell = TodayCell()
            
            cell.addSubview(todayCell)
            
            todayCell.centerInSuperview(size: .init(width: 250, height: 250))
            
            return cell
        }
        
        let cell = AppFullscreenDescribeCell()
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
}
