//
//  Service.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/26/20.
//

import Foundation

class Service {
    
    static let shared = Service() // Singleton
    
    // MARK: - Decode and Fetch Itune Search

    func fetchApps(searchTerm: String, comletion: @escaping([Result], Error?) -> ()){
        print("Fetching Itunes apps from Service Layer")
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"

        guard let url = URL(string: urlString) else { return }

        // fetch data from intenet
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch app: ", err)
                comletion([], nil)
                return
            }

            // Success
//            print(data)
//            print(String(data: data!, encoding: .utf8))
            guard let data = data else { return }

            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                    
                comletion(searchResult.results, nil)
                
                /* This is code local in AppSearchController
                self.appResults = searchResult.results

                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }*/

            } catch let jsonErr {
                print("Failed to decode JSON", jsonErr)
                comletion([], jsonErr)
            }



        }.resume() // fires off the request
    }
    
    // MARK: Fetch Game JSON
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let urlSring = "https://rss.itunes.apple.com/api/v1/vn/ios-apps/top-free/games/50/explicit.json"
        guard let url = URL(string: urlSring) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            
            guard let data = data else { return }

            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data)
                //print("TAG", appGroup.feed.results)
                
                // Success
                appGroup.feed.results.forEach { (FeedResult) in
                    print("TAG", FeedResult.name)
                } 
                
                completion(appGroup, nil)

            } catch let jsonErr {
                completion(nil, err)
                print("Failed to decode JSON", jsonErr)
                
            }
            
        }.resume()
        
        
        
        
    }
    
}
