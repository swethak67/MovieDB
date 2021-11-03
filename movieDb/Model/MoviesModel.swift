//
//  movieDb
//
//  Created by swetha on 10/21/21. 
//  Copyright © 2021 swetha. All rights reserved.
//

import Foundation

struct MoviesModel: Codable {

    let page: Int?
    let results: [Results]?
    let totalPages: Int?
    let totalResults: Int?

    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    struct Results: Codable {
        let adult: Bool?
        let genreIds: [Int]?
        let id: Int?
        let originalLanguage: String?
        let originalTitle: String?
        let overview: String?
        let popularity: Double?
        let posterPath: String?
        let releaseDate: String?
        let title: String?
        let video: Bool?
        let voteAverage: Double?
        let voteCount: Int?

        private enum CodingKeys: String, CodingKey {
            case adult = "adult"
            case genreIds = "genre_ids"
            case id = "id"
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview = "overview"
            case popularity = "popularity"
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title = "title"
            case video = "video"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }

}

