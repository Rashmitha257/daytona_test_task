//
//  NewsDetailsViewController.swift
//  DaytonaTest
//
//  Created by Softsuave on 06/10/2023.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var newsImagesView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    
    //MARK: - Variables
    var newsDetails: ImageDetails?
    var viewModel = NewsDetailsViewModel()

//    MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()
        updateImageViewWithImageData()
        initialSetUpOfViewWithDetails()
       
    }
    
    /// Setting navigaion bar button title name
    func setNavigationBarTitle() {
        self.navigationItem.title = newsDetails?.source?.name ?? "News Details"
    }
    
    /// Doing initial setup for news details screen
    func initialSetUpOfViewWithDetails() {
        if let news = newsDetails {
           getImagedata(imageDetails: news)
            titleLabel.text = news.title
            contentLabel.text = news.content
            discriptionLabel.text = news.description
            publishedLabel.text = news.publishedAt
        }
       
    }
    
    /// Updating image view usnig image data
    /// - Parameter imageDetails: image news details which we need image data
    func getImagedata(imageDetails: ImageDetails) {
        if let data = imageDetails.data {
            self.newsImagesView.image = UIImage(data: data)
        } else if let url = imageDetails.urlToImage {
            viewModel.getImageData(url:url)
        }

    }
    
    /// updating news images view using image data
    func updateImageViewWithImageData() {
        viewModel.imagedata = { [weak self] data in
            DispatchQueue.main.async {
                self?.newsImagesView.image = UIImage(data: data)
                self?.newsDetails?.data = data
            }
        }
    }
    
}
