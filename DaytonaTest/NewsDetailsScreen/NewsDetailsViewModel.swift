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
    
    func getPublishedTime(stringDate: String) -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormate
        if let publishedDate = dateFormatter.date(from: stringDate){
            let calendar = Calendar.current
            let differenceInTime = calendar.dateComponents([.hour, .day, .minute], from: publishedDate, to: date)
            if let day = differenceInTime.day, day > 0 {
                return "\(day)" + dayAgo
            }
            if let hour = differenceInTime.hour, hour > 0 {
                return "\(hour)" + hourAgo
            }
            if let minute = differenceInTime.minute, minute > 0 {
                return "\(minute)" + minutesAgo
            }
        }
        return justNow
    }
}
