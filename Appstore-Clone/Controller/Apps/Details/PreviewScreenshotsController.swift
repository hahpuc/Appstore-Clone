//
//  PreviewScreenshotsController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 11/28/20.
//

import UIKit

class ScreenshowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class PreviewScreenshotsController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
    var app: Result? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(ScreenshowCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ScreenshowCell
        
        let screenshotUrl = app?.screenshotUrls[indexPath.row]
        
        cell.imageView.sd_setImage(with: URL(string: screenshotUrl ?? "" ))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
    
    
}
 
