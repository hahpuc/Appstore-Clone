//
//  TodayCell.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 12/26/20.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "draw"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        layer.cornerRadius = 16
        
        addSubview(imageView)
        imageView.contentMode = .scaleToFill
        imageView.centerInSuperview(size: .init(width: 250, height: 250))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
