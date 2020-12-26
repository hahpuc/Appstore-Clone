//
//  AppSearchController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/25/20.
//

import UIKit
import SDWebImage

class AppSearchController: VerticalController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellID = "cell111"
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate var appResults = [Result]()
    
    fileprivate let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter search term above..."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = AppDetailController()
        detailController.appID = String(appResults[indexPath.row].trackId)
        detailController.navigationController?.title = appResults[indexPath.row].trackName
        
        self.navigationController?.pushViewController(detailController, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        
        setUpSearchBar()
        
        // fetchITunesApps()
    }
    
    fileprivate func setUpSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
    }
    
    var timer: Timer?

    // - MARK: SearchBar TextEdit
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        // introduce some delay befor performing the search
        // throttling the search: If don't have timer object, the screen will has flash
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            
            // Fetch data using iTunes Search APIs
            Service.shared.fetchApps(searchTerm: searchText) { (res, error) in
                
                if let error = error {
                    print("Failed to fetch data: ", error)
                    return
                }
                
                self.appResults = res?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    
    
    // MARK: - Fetch Itune Search
    fileprivate func fetchITunesApps(){
        Service.shared.fetchApps(searchTerm: "instagram") { (res, err) in
            if let err = err {
                print("Failed to fetch data: ", err)
                return
            }
            
            self.appResults = res?.results ?? []
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
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    // MARK: - Fetch Data to Cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
                
        cell.appResult = appResults[indexPath.row]
        
        return cell
    }

}
