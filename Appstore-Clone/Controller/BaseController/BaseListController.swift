//
//  BaseListController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/28/20.
//

import UIKit

class BaseListController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
