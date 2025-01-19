//
//  PopularMoviesRequest.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

struct PopularMoviesRequest: Codable {
    var include_adult: Bool
    var include_video: Bool
    var language: String
    var page: Int
    var sort_by: String
}
