//
//  MovieViewModel.swift
//  movieDb
//
//  Created by swetha on 10/21/21.
//  Copyright © 2021 swetha. All rights reserved.

import Foundation

class MovieViewModel: NSObject {
    
    var moviesList : [MoviesModel.Results] = []
    var currentPage = 1
    var totalPages = 1
    var isLoadingNews = false
    
    
    // MARK: API Calls
    /*@usage: fetch the movies based text*/
    func discoverPopularMovies(completionHandler: @escaping (Status) -> Void) {
        isLoadingNews = true
        let urlString = "\(endPointURL)?api_key=\(apiKey)&language=en-US&sort_by=popularity.desc&page=" + "\(currentPage+1)"
        APIConnector.requestData(urlString: urlString) { [weak self] statusValue, data in
            if statusValue == Status.success {
                if let movies = try? JSONDecoder().decode(MoviesModel.self, from: data!) {
                    self?.isLoadingNews = false
                    self?.moviesList.append(contentsOf:  movies.results ?? [])
                    self?.currentPage = movies.page ?? 0
                    self?.totalPages = movies.totalPages ?? 0
                    completionHandler(Status.success)
                }
            }
        }
    }
    
}

// update collection view based on data
extension MovieViewModel {
    func numberOfItemsInTheSection() -> Int {
        return self.moviesList.count
    }
    
    func itemAtSection(indexPath: IndexPath) -> MoviesModel.Results {
        return self.moviesList[indexPath.row]
    }
}

