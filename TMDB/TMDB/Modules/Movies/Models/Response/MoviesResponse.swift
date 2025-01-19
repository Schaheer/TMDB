//
//  MoviesResponse.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

struct MoviesResponse: Codable {
    var page: Int?
    var results: [Results]?
    var total_pages: Int?
    var total_results: Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case total_pages = "total_pages"
        case total_results = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .page) {
            page = value
        }
        
        if let value = try values.decodeIfPresent([Results].self, forKey: .results) {
            results = value
        }
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .total_pages) {
            total_pages = value
        }
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .total_results) {
            total_results = value
        }
    }
}

struct Results: Codable {
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case genre_ids = "genre_ids"
        case id = "id"
        case original_language = "original_language"
        case original_title = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case poster_path = "poster_path"
        case release_date = "release_date"
        case title = "title"
        case video = "video"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try values.decodeIfPresent(Bool.self, forKey: .adult) {
            adult = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .backdrop_path) {
            backdrop_path = value
        }
        
        if let value = try values.decodeIfPresent([Int].self, forKey: .genre_ids) {
            genre_ids = value
        }
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .id) {
            id = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .original_language) {
            original_language = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .original_title) {
            original_title = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .overview) {
            overview = value
        }
        
        if let value = try values.decodeIfPresent(Double.self, forKey: .popularity) {
            popularity = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .poster_path) {
            poster_path = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .release_date) {
            release_date = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .title) {
            title = value
        }
        
        if let value = try values.decodeIfPresent(Bool.self, forKey: .video) {
            video = value
        }
        
        if let value = try values.decodeIfPresent(Double.self, forKey: .vote_average) {
            vote_average = value
        }
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .vote_count) {
            vote_count = value
        }
    }
}
