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
    func updateInitialUI() {
        updateImage()
        downLoadImage()
        updateLabelValue()
        addBorderAndColor()
    }
    
    func addBorderAndColor() {
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        outerViewForlabel.layer.borderWidth = 1
        outerViewForlabel.layer.borderColor = UIColor.lightGray.cgColor
        outerViewForlabel.layer.cornerRadius = 5
    }
    
    func updateImage() {
        viewModel.imageData = { [weak self] data in
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)
                self?.headLineDetails?.data = data
            }
        }
    }
    
    func downLoadImage() {
        if let data = headLineDetails?.data {
            self.imageView.image = UIImage(data: data)
        } else if let url = headLineDetails?.urlToImage {
            viewModel.getImageData(url:url)
        }
    }
    
    func updateLabelValue() {
        imageTitleLabel.text = headLineDetails?.title
    }
    
    
    
}
