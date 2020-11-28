//
//  AppDetailController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 11/28/20.
//

import UIKit

class AppDetailController: VerticalController, UICollectionViewDelegateFlowLayout {
    
    var appID: String! {
        didSet {
            print("Here is my app id: ", appID!)
            
            let urlString = "https://itunes.apple.com/lookup?id=\(appID ?? "")"
            
            // Fetch Data
            Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, err) in
                print(result?.results.first?.formattedPrice ?? "")
            }
        }
    }
    
    let detailCellID = "detailCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellID)
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Set up Collection View
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellID, for: indexPath) as! AppDetailCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}
