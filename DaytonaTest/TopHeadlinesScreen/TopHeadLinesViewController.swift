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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeadlineScreenImageCollectionViewCell", for: indexPath) as! HeadlineScreenImageCollectionViewCell
        cell.headLineDetails = headlineList[indexPath.row]
        cell.updateInitialUI()
        return cell
    }
    
    
    
    
}
