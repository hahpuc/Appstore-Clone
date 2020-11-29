//
//  AppDetailController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 11/28/20.
//

import UIKit

class AppDetailController: VerticalController, UICollectionViewDelegateFlowLayout {
    
    var app: Result?
    var reviews: Reviews?
    
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
            
            let reviewUrl = "https://itunes.apple.com/rss/customerreviews/id=\(appID ?? "")/sortBy=mostRecent/json"
            
            Service.shared.fetchGenericJSONData(urlString: reviewUrl) { (reviews: Reviews?, err) in
                if let err = err {
                    print("Failed to decode review: ", err)
                    return
                }
                
                self.reviews = reviews
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
//                reviews?.feed.entry.forEach({ (entry) in
//                    print("review: ",entry.title, entry.content)
//                })
                
//                reviews?.feed.entry.forEach({ (author) in
//                    print("review: ", author.author.name)
//                })
                
                reviews?.feed.entry.forEach({ (Entry) in
                    print("review", Entry.author.name, Entry.rating)
                })
            }
            
            print("url ",reviewUrl)
        }
    }
    
    let detailCellID = "detailCellID"
    let previewCellID = "previewCellID"
    let reviewCellID = "reviewCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellID)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellID)
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: reviewCellID)
        
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Set up Collection View
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellID, for: indexPath) as! AppDetailCell
            
            cell.app = app
            
            return cell
        
        
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellID, for: indexPath) as! PreviewCell
            
            cell.horizontalController.app = self.app
            
            return cell
            
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCellID, for: indexPath) as! ReviewCell
            
            cell.reviewController.reviews = self.reviews
            
            
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellID, for: indexPath)
            return cell
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.row {
        case 0:
            // Calculate the necessary size for our cell
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            
            dummyCell.app = app
            dummyCell.layoutIfNeeded()
            
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            
            return .init(width: view.frame.width, height: estimatedSize.height)
            
        case 1:
            return .init(width: view.frame.width, height: 400)
            
        case 2:
            return .init(width: view.frame.width, height: 200)
            
        default:
            return .zero
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 16, right: 0)
    }
}
