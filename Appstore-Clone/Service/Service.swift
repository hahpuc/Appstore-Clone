//
//  Service.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/26/20.
//

import Foundation
import UIKit

class Service {
    
    static let shared = Service() // Singleton
    
    // MARK: - Decode and Fetch Itune Search

    func fetchApps(searchTerm: String, completion: @escaping(SearchResult?, Error?) -> ()){
        print("Fetching Itunes apps from Service Layer")
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // MARK: -Fetch JSON Apps Screen
    func fetchFreeGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let urlString = "https://rss.itunes.apple.com/api/v1/vn/ios-apps/top-free/games/50/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchPaidGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let urlString = "https://rss.itunes.apple.com/api/v1/vn/ios-apps/top-paid/all/50/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchTopCrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let urlString = "https://rss.itunes.apple.com/api/v1/vn/ios-apps/top-grossing/all/50/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }

    // Helper Fetch App Group
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // Header in App Screen
    func fetchSocailApp( completion: @escaping ([SociallApp]?, Error?) -> Void) {
        
        let urlString = "http://api.letsbuildthatapp.com/appstore/social"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // MARK: GENERIC JSON FUNCTION
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        //print("T is: ", T.self)
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            } 
            
            guard let data = data else { return }

            do {
                
                let objects = try JSONDecoder().decode(T.self, from: data)
                //print("TAG", appGroup.feed.results)
                
                // Success
                completion(objects, nil)

            } catch let jsonErr {
                completion(nil, err)
                print("Failed to decode JSON", jsonErr)
                
            }
            
        }.resume()
    }
    
}


//class Stack<T: Decodable> {
//    var items = [T]()
//    
//    func push(item: T) {
//        items.append(item)
//    }
//    
//    func pop() -> T? {
//        return items.last
//    }
//}
//
//
//
//func dummyFunc() {
//    
//    let stackOfStrings = Stack<String>()
//    stackOfStrings.push(item: "Has to be String")
//    
//    let stackOfInts = Stack<Int>()
//    stackOfInts.push(item: 1)
//}

