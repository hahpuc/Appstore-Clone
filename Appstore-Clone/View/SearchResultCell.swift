//
//  SearchResultCell.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/25/20.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    // MARK: - Initialize components
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        
        return iv
    }()
    
    let nameLabel: UILabel = {
        let text = UILabel()
        text.text = "App name"
        
        return text
    }()
    
    let categoryLabel: UILabel = {
        let text = UILabel()
        text.text = "Photo and Videos"
        
        return text
    }()
    
    let RatingLabel: UILabel = {
        let text = UILabel()
        text.text = "9.26M"
        
        return text
    }()
    

    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 12 
        
        return imageView;
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelStackView = VerticalStackView(arrangedSubviews: [
            nameLabel, categoryLabel, RatingLabel
        ])
                
        let infoTopStackView = UIStackView(arrangedSubviews: [
            iconImageView, labelStackView, getButton
        ])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenshotStackView = UIStackView(arrangedSubviews: [
            screenshot1ImageView, screenshot2ImageView, screenshot3ImageView
        ])
        screenshotStackView.spacing = 12;
        screenshotStackView.distribution = .fillEqually
        
        
        let overralStackView = VerticalStackView(arrangedSubviews: [
            infoTopStackView, screenshotStackView
        ], spacing: 16)

        addSubview(overralStackView)
        
        // User Helper: UIView+Layout.swift
        overralStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
