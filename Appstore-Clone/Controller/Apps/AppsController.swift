//
//  AppsController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/29/20.
//

import UIKit

class AppsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellID = "123dfas"
    fileprivate let headID = "HeadID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellID)
        
        // Nested Header Collection Cell in to AppController
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headID)
        
        fetchData()
    }
    
    // MARK: - Fetch Data
    fileprivate func fetchData() {
        print("Tag: ","fetching new JSON data ...")
        Service.shared.fetchGames { (appGroup, err) in
            if let err = err {
                print("Failed to fetch game:", err)
            }
            
            print("TAG", appGroup?.feed.results)
        }
    }
    
    // MARK: - Set up Header View Cell
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headID, for: indexPath)
    
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    
    // MARK: - Set up Collection View Cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
}
