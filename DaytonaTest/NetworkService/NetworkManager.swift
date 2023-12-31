//
//  NetworkManager.swift
//  DaytonaTest
//
//  Created by Softsuave on 05/10/2023.
//

import Foundation


final class NetworkManager {
    static let getNetworkManagerInstance = NetworkManager()
    
    private init() { }
    
    func getImageList() async throws -> [NewsDetails] {
        guard let url = URL(string: apiUrl) else {throw NewsHeadlineFetchError.invalidURL}
        print(apiUrl)
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(NewsList.self, from: data)
        return result.articles
        
    }
    
    func getImageData(urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {throw NewsHeadlineFetchError.invalidURL}
        let data = try Data(contentsOf: url)
        return data
    }
   
}
