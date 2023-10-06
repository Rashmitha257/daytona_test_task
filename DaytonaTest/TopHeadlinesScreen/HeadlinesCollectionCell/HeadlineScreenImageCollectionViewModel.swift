//
//  HeadlineScreenImageCollectionViewModel.swift
//  DaytonaTest
//
//  Created by Softsuave on 05/10/2023.
//

import Foundation

class HeadlineScreenImageCollectionViewModel {
//    MARK: - Variables
    var networkInstance = NetworkManager.getNetworkManagerInstance
    var imageData: ((Data) -> Void)?
    
//    MARK: - Other func
    
    /// Getting image data using image url
    /// - Parameter url: image url for which we need data
    func getImageData(url: String) {
        Task {
            let data = try await networkInstance.getImageData(urlString: url)
            imageData?(data)
        }
    }
}
