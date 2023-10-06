//
//  HeadlineScreenImageCollectionViewModel.swift
//  DaytonaTest
//
//  Created by Softsuave on 05/10/2023.
//

import Foundation

class HeadlineScreenImageCollectionViewModel {
    var networkInstance = NetworkManager.getNetworkManagerInstance
    var imageData: ((Data) -> Void)?
    
    func getImageData(url: String) {
        Task {
            let data = try await networkInstance.getImageData(urlString: url)
            imageData?(data)
        }
    }
}
