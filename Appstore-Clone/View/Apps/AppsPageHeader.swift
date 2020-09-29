//
//  AppsPageHeader.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/29/20.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {

    let headerHorizontalController = AppsHeaderHorizontalController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(headerHorizontalController.view)
        headerHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
