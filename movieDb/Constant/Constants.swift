//
//  Constants.swift
//  movieDb
//
//  Created by swetha on 10/21/21. 
//  Copyright © 2021 swetha. All rights reserved.
import Foundation

let endPointURL = "https://api.themoviedb.org/3/discover/movie"
let imageEndPointURL = "https://image.tmdb.org/t/p/w500"
let apiKey = "3136b8e14a0cdfc888b91d8600887e91"

let dateFormatYearMonthDate = "yyyy-MM-dd"
let dateFormatMonthNameDateYear = "MMM dd, YYYY"
let dateFormat = "MM/dd/yy"


enum AppConstants {
    static let placeHolder = "place_holder"
    static let appTitle = "POPULAR MOVIES"
    static let detailBaseUrl = "https://movies.disney.com"
    static let emptyString = ""
    static let defaultIntValue = 0
    static let defaultDoubleValue = 0.0
    static let imageviewCornerRadius = 16.0
}
