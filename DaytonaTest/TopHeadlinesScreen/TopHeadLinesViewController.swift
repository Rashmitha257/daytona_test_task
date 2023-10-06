//
//  ViewController.swift
//  DaytonaTest
//
//  Created by Softsuave on 05/10/2023.
//

import UIKit

class TopHeadLinesViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    //MARK: - Variables
    var topHeadLinesViewModel = TopHeadLinesViewModel()
    var headlineList = [ImageDetails]()
    
    //MARK: - Overrride methods
    override func viewDidLoad() {
        super.viewDidLoad()
        getAndUpdateListInCollectionView()
        getHeadListApiCall()
        navigationController?.navigationBar.backgroundColor = UIColor.systemOrange
    }
    
    //MARK: - Other func
    /// Getting head line list and displaying in collection view
    func getAndUpdateListInCollectionView() {
        topHeadLinesViewModel.headlineListWithImage = { [weak self] list in
            self?.headlineList = list
            DispatchQueue.main.async {
                self?.imageCollectionView.reloadData()
            }
            
        }
    }
    
    /// Getting list from network call
    func getHeadListApiCall() {
        topHeadLinesViewModel.getHeadLinesList()
    }
}

//MARK: - Collection view
extension TopHeadLinesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        headlineList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeScreenIdentifier, for: indexPath) as! HeadlineScreenImageCollectionViewCell
        cell.headLineDetails = headlineList[indexPath.row]
        cell.updateInitialUI()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigateToDetailsScreen(newsDetails: headlineList[indexPath.row])
    }
    
    
    
}
// MARK: - Navigations
extension TopHeadLinesViewController {
    
    /// Navigation to news details screen
    /// - Parameter newsDetails: news details to display in news details screen
    func navigateToDetailsScreen(newsDetails: ImageDetails) {
        let vc =  UIStoryboard(name: storyBorad, bundle: nil).instantiateViewController(withIdentifier: newsDetailsScreen) as! NewsDetailsViewController
        vc.newsDetails = newsDetails
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
