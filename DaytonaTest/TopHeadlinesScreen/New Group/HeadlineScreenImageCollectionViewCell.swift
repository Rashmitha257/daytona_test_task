//
//  HeadlineScreenImageCollectionViewCell.swift
//  DaytonaTest
//
//  Created by Softsuave on 05/10/2023.
//

import UIKit

class HeadlineScreenImageCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var outerViewForlabel: UIView!
    @IBOutlet weak var imageTitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Variables
    var viewModel = HeadlineScreenImageCollectionViewModel()
    var headLineDetails: ImageDetails?
    
    //MARK: - Other func
    
    /// Doing initial set up for collection view cell
    func updateInitialUI() {
        updateImage()
        downLoadImage()
        updateLabelValue()
        addBorderAndColor()
    }
    
    /// Adding borfer and border width for main view and title lable
    func addBorderAndColor() {
        self.contentView.getBorderWithGray(2)
        outerViewForlabel.getBorderWithGray(1)
        outerViewForlabel.layer.cornerRadius = 5
    }
    
    /// setting image using data
    func updateImage() {
        viewModel.imageData = { [weak self] data in
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)
                self?.headLineDetails?.data = data
            }
        }
    }
    
    /// Downloading image using image url
    func downLoadImage() {
        if let data = headLineDetails?.data {
            self.imageView.image = UIImage(data: data)
        } else if let url = headLineDetails?.urlToImage {
            viewModel.getImageData(url:url)
        }
    }
    
    /// Updating totle lable value
    func updateLabelValue() {
        imageTitleLabel.text = headLineDetails?.source?.name
    }
    
    
    
}
