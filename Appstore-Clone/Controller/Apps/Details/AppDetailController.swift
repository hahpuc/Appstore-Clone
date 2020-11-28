//
//  AppDetailController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 11/28/20.
//

import UIKit

class AppDetailController: VerticalController, UICollectionViewDelegateFlowLayout {
    
    var app: Result?
    
    var appID: String! {
        didSet {
            print("Here is my app id: ", appID!)
            
            let urlString = "https://itunes.apple.com/lookup?id=\(appID ?? "")"
            
            // Fetch Data
            Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, err) in
                
                let app = result?.results.first
                self.app = app
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    let detailCellID = "detailCellID"
    let previewCellID = "previewCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellID)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellID)
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Set up Collection View
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellID, for: indexPath) as! AppDetailCell
            
            cell.app = app
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellID, for: indexPath) as! PreviewCell
            
            cell.horizontalController.app = self.app
            
            return cell
        }
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 0 {
            // Calculate the necessary size for our cell
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            
            dummyCell.app = app
            dummyCell.layoutIfNeeded()
            
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            
            return .init(width: view.frame.width, height: estimatedSize.height)
        }
        else {
            return .init(width: view.frame.width, height: 400)
        }
        
    }
}
