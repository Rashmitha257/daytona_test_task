//
//  NewsDetails.swift
//  DaytonaTest
//
//  Created by Softsuave on 06/10/2023.
//

import Foundation

class NewsDetails: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    var data: Data?
    var source: Source?
    
    
    private enum CodingKeys: String, CodingKey {
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
        case source = "source"
        case data
    }
    
}

class Source: Codable {
    var name: String?
}

class NewsList: Codable {
    var status: String?
    var totalResults: Int?
    var articles = [NewsDetails]()
}

enum NewsHeadlineFetchError: Error {
    case invalidURL
    case dataMissing
}
