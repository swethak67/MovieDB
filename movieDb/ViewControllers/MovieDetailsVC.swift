//
//  MovieDetailsVC.swift
//  movieDb
//
//  Created by swetha on 10/21/21. 
//  Copyright © 2021 swetha. All rights reserved.

import UIKit

class MovieDetailsVC: UIViewController {
    @IBOutlet var myScrollview: UIScrollView!
    
    @IBOutlet weak var labelMovieName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var popularityLable: UILabel!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var voteLable: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView?.layer.cornerRadius = AppConstants.imageviewCornerRadius
        }
    }
    
    var movieInfo : MoviesModel.Results?
    let moviesViewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = AppConstants.appTitle
        updateData()
    }
    override func viewDidAppear(_ animated: Bool) {
        myScrollview?.isScrollEnabled = true
    }
    
    func updateData() {
        labelMovieName?.text = movieInfo?.originalTitle
        let releaseDate = moviesViewModel.convertDateToProperDateFormat(date: "\(movieInfo?.releaseDate ?? AppConstants.emptyString)", dateFormat: dateFormatYearMonthDate, convertDateFormat: dateFormat)
        labelDate?.text = releaseDate
        labelInfo?.text = movieInfo?.overview
        urlLabel?.text  = "\(AppConstants.detailBaseUrl)\(movieInfo?.posterPath ?? AppConstants.emptyString)"
        voteLable?.text = String(movieInfo?.voteCount ?? AppConstants.defaultIntValue)
        ratingLabel?.text = String(movieInfo?.voteAverage ?? AppConstants.defaultDoubleValue)
        popularityLable?.text = String(movieInfo?.popularity ?? AppConstants.defaultDoubleValue)
        let url = URL(string: "\(imageEndPointURL)\(movieInfo?.posterPath ?? AppConstants.emptyString)")
        if let imageUrl = url {
            imageView.kf.setImage(with: imageUrl)
        } else {
            imageView?.image = UIImage(named: AppConstants.placeHolder)
        }
    }

}
