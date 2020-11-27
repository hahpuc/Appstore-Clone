//
//  AppsController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/29/20.
//

import UIKit

class AppsController: VerticalController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellID = "123dfas"
    fileprivate let headID = "HeadID"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        
        aiv.startAnimating()
        aiv.color = .black
        aiv.hidesWhenStopped = true
        
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellID)
        
        // Nested Header Collection Cell in to AppController
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headID)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        
        fetchData()
    }
    
    var sociallApps = [SociallApp]()
    var groups = [AppGroup]()
    
    // MARK: - Fetch Data
    fileprivate func fetchData() {
        print("Tag: ","fetching new JSON data ...")
        
        
        // Help you sync your data fetches together
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchTopCrossing { (appGroup, err) in
            dispatchGroup.leave()
            if let group = appGroup {
                self.groups.append(group)
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
            print("Done", " with Top Crossing")
        }
        
        dispatchGroup.enter()
        Service.shared.fetchFreeGames { (appGroup, err) in
            dispatchGroup.leave()
            if let group = appGroup {
                self.groups.append(group)
            }
            
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()

            }
            
            print("Done", " with Free Game")

        }
        
        dispatchGroup.enter()
        Service.shared.fetchPaidGames() { (appGroup, err) in
            dispatchGroup.leave()
            if let group = appGroup {
                self.groups.append(group)
            }
            
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()

            }
            
            print("Done", " with Paid Game")

        }
        
//        dispatchGroup.enter()
//
//        Service.shared.fetchSocailApp { (apps, err) in
//            dispatchGroup.leave()
//
//            self.sociallApps = apps ?? []
//            
//        }
        
        // completion
        dispatchGroup.notify(queue: .main) {
            print("Done","Completed your dispatch group task")
            
            self.activityIndicatorView.stopAnimating()
        }
    }

    
    // MARK: - Set up Header View Cell
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headID, for: indexPath) as! AppsPageHeader
        
        header.headerHorizontalController.socialApps = self.sociallApps
    
        header.headerHorizontalController.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    
    // MARK: - Set up Collection View Cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsGroupCell
        
        cell.titleLabel.text = groups[indexPath.row].feed.title
        cell.horizontalController.appGroup = groups[indexPath.row]
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
}
