//
//  AppSearchController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/25/20.
//

import UIKit
import SDWebImage

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellID = "cell111"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        
        fetchITunesApps()
    }
    
    fileprivate var appResults = [Result]()
    
    // MARK: - Fetch Itune Search
    fileprivate func fetchITunesApps(){
        Service.shared.fetchApps { (result, err) in
            if let err = err {
                print("Failed to fetch data: ", err)
                return
            }
            
            self.appResults = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    // Add UICollectionViewDelegateFlowLayout to access this func
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    // MARK: - Fetch Data to Cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
                
        cell.appResult = appResults[indexPath.row]
        
        return cell
    }
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
