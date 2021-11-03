//
//  MovieCell.swift
//  movieDb
//
//  Created by swetha on 10/21/21. 
//  Copyright © 2021 swetha. All rights reserved.

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var imageMoviePoster: UIImageView!
    @IBOutlet weak var labelMovieName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(viewModel: MoviesModel.Results?) {
        labelMovieName?.text = viewModel?.originalTitle
        labelDate?.text = self.convertDateToProperDateFormat(date: "\(viewModel?.releaseDate ?? AppConstants.emptyString)", dateFormat: dateFormatYearMonthDate, convertDateFormat: dateFormatMonthNameDateYear)
        labelRating?.text = "\(viewModel?.voteAverage ?? AppConstants.defaultDoubleValue)"
        let url = URL(string: "\(imageEndPointURL)\(viewModel?.posterPath ?? AppConstants.emptyString)")
        if let imageUrl = url {
            imageMoviePoster?.kf.setImage(with: imageUrl)
        } else {
            imageMoviePoster?.image = UIImage(named: AppConstants.placeHolder)
        }
    }

}
