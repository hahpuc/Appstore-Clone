//
//  AppFullscreenController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 12/26/20.
//

import UIKit

class AppFullscreenController: UITableViewController {
    
    var dismisHandle: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    let cellID = "tb1"
    let headerID = "xasda"
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.item == 0) {
            
            let headerCell = AppFullscreenHeaderCell()
            
            headerCell.closeButton.addTarget(self, action: #selector(closeClick), for: .touchUpInside)
            return headerCell
        }
        
        let cell = AppFullscreenDescribeCell()
    
        return cell
    }
    
    @objc func closeClick(button: UIButton) {
        print("Click close")
        button.isHidden = true
        self.dismisHandle?()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return 450
        }
        
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
}
