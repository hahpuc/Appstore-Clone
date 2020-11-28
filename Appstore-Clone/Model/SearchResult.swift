//
//  SearchResult.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/26/20.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let artworkUrl100: String // App icon
    let screenshotUrls: [String]
    let formattedPrice: String
    let description: String
    let releaseNotes: String
}
