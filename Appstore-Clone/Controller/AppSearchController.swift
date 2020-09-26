//
//  AppSearchController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/25/20.
//

import UIKit

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellID = "cell111"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        
        fetchITunesApps()
    }
    
    fileprivate func fetchITunesApps(){
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        // fetch data from intenet
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch app: ", err)
            }
            
            // Success
            
//            print(data)
//            print(String(data: data!, encoding: .utf8))
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                //print(searchResult)
                
                searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
                 
            } catch let jsonErr {
                print("Failed to decode JSON", jsonErr)
            }
            
            
            
        }.resume() // fires off the request
    }
    
    // Add UICollectionViewDelegateFlowLayout to access this func
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        return cell
    }
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
