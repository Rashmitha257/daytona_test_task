//
//  TopHeadLinesViewModel.swift
//  DaytonaTest
//
//  Created by Softsuave on 05/10/2023.
//

import Foundation

class TopHeadLinesViewModel {
    //MARK: - Variables
    var networkInstance = NetworkManager.getNetworkManagerInstance
    var headlineListWithImage: (([ImageDetails]) -> Void)?
    
    //MARK: - Other func
    
    /// Getting the headline list with details
    func getHeadLinesList() {
        Task {
            let headlineList = try await networkInstance.getImageList()
            headlineListWithImage?(headlineList)
        }
    }
}
