//
//  AppGroup.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/30/20.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable  {
    let name, artistName, artworkUrl100: String
}
