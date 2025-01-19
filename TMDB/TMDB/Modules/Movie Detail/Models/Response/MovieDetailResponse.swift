//
//  MovieDetailResponse.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

struct MovieDetailResponse: Codable {
    var adult: Bool?
    var backdrop_path: String?
    var belongs_to_collection: Belongs_to_collection?
    var budget: Int?
    var genres: [Genres]?
    var homepage: String?
    var id: Int?
    var imdb_id: String?
    var origin_country: [String]?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var production_companies: [Production_companies]?
    var production_countries: [Production_countries]?
    var release_date: String?
    var revenue: Int?
    var runtime: Int?
    var spoken_languages: [Spoken_languages]?
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case belongs_to_collection = "belongs_to_collection"
        case budget = "budget"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdb_id = "imdb_id"
        case origin_country = "origin_country"
        case original_language = "original_language"
        case original_title = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case poster_path = "poster_path"
        case production_companies = "production_companies"
        case production_countries = "production_countries"
        case release_date = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case spoken_languages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
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
        
        if let value = try values.decodeIfPresent(Belongs_to_collection.self, forKey: .belongs_to_collection) {
            belongs_to_collection = value
        }
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .budget) {
            budget = value
        }
        
        if let value = try values.decodeIfPresent([Genres].self, forKey: .genres) {
            genres = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .homepage) {
            homepage = value
        }
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .id) {
            id = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .imdb_id) {
            imdb_id = value
        }
        
        if let value = try values.decodeIfPresent([String].self, forKey: .origin_country) {
            origin_country = value
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
        
        if let value = try values.decodeIfPresent([Production_companies].self, forKey: .production_companies) {
            production_companies = value
        }
        
        if let value = try values.decodeIfPresent([Production_countries].self, forKey: .production_countries) {
            production_countries = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .release_date) {
            release_date = value
        }
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .revenue) {
            revenue = value
        }
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .runtime) {
            runtime = value
        }
        
        if let value = try values.decodeIfPresent([Spoken_languages].self, forKey: .spoken_languages) {
            spoken_languages = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .status) {
            status = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .tagline) {
            tagline = value
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

struct Belongs_to_collection: Codable {
    var id: Int?
    var name: String?
    var poster_path: String?
    var backdrop_path: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case poster_path = "poster_path"
        case backdrop_path = "backdrop_path"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .id) {
            id = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .name) {
            name = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .poster_path) {
            poster_path = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .backdrop_path) {
            backdrop_path = value
        }
    }
    
}

struct Genres: Codable {
    var id: Int?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .id) {
            id = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .name) {
            name = value
        }
    }
}

struct Production_companies: Codable {
    var id: Int?
    var logo_path: String?
    var name: String?
    var origin_country: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case logo_path = "logo_path"
        case name = "name"
        case origin_country = "origin_country"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .id) {
            id = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .logo_path) {
            logo_path = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .name) {
            name = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .origin_country) {
            origin_country = value
        }
    }
}

struct Production_countries: Codable {
    var iso_3166_1: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case iso_3166_1 = "iso_3166_1"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try values.decodeIfPresent(String.self, forKey: .iso_3166_1) {
            iso_3166_1 = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .name) {
            name = value
        }
    }
}

struct Spoken_languages: Codable {
    var english_name: String?
    var iso_639_1: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case english_name = "english_name"
        case iso_639_1 = "iso_639_1"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try values.decodeIfPresent(String.self, forKey: .english_name) {
            english_name = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .iso_639_1) {
            iso_639_1 = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .name) {
            name = value
        }
    }
}
