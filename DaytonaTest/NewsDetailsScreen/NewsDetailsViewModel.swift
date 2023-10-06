//
//  NewsDetailsViewModel.swift
//  DaytonaTest
//
//  Created by Softsuave on 06/10/2023.
//

import Foundation

class NewsDetailsViewModel {
//    MARK: - variables
    var imagedata: ((Data) -> Void)?
    
//    MARK: - Other func
    
    /// Getting image data using image url
    /// - Parameter imageDetails: news details for which we required image data`
    func getImageData(url: String) {
        Task {
            let data = try await NetworkManager.getNetworkManagerInstance.getImageData(urlString: url)
            imagedata?(data)
        }
    }
}
