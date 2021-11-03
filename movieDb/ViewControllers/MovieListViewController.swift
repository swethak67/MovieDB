//
//  ViewController.swift
//  movieDb
//
//  Created by swetha on 10/21/21. 
//  Copyright © 2021 swetha. All rights reserved.

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    let moviesViewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = AppConstants.appTitle
        setUpCollectionView()
        getPopularMovies()
    }
    
    private func setUpCollectionView() {
         movieCollectionView.delegate = self
         movieCollectionView.dataSource = self
        movieCollectionView.backgroundColor = UIColor.black

       }
    
    func getPopularMovies() {
        moviesViewModel.discoverPopularMovies() { statusValue in
            if statusValue == Status.success {
                DispatchQueue.main.async {
                self.movieCollectionView.reloadData()
                }
            }
        }
    }
}

extension MovieListViewController: UICollectionViewDataSource {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesViewModel.numberOfItemsInTheSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        movieCell.set(viewModel: moviesViewModel.itemAtSection(indexPath: indexPath))
        return movieCell
    }
}

extension MovieListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailsVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "MovieDetailsVC") as! MovieDetailsVC
        movieDetailsVC.movieInfo = moviesViewModel.itemAtSection(indexPath: indexPath)
        self.navigationController?.pushViewController(movieDetailsVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !moviesViewModel.isLoadingNews){
            if moviesViewModel.currentPage < moviesViewModel.totalPages {
                getPopularMovies()
            }
        }
    }
    
}

extension MovieListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemsPerRow: CGFloat = 0
        let orientation = UIDevice.current.orientation
        if(orientation == .landscapeLeft || orientation == .landscapeRight) {
            itemsPerRow = 6
        } else {
            itemsPerRow = 3
        }
        let widthPerItem = view.frame.width / itemsPerRow
        let height = widthPerItem * 2 - 15
        return CGSize(width: widthPerItem, height: height)
    }
}

