//
//  URLHelper.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

struct URLHelper {
    
    // Generate a URL with query parameters
    static func generateURL(baseEndpoint: String, withPath path: String, queryParams: [String: Any]?) -> String? {
        guard let baseURL = URL(string: baseEndpoint) else { return nil }
        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)
        
        if let queryParams = queryParams {
            components?.queryItems = queryParams.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
        }
        
        guard let finalURL = components?.url?.absoluteString.removingPercentEncoding else {
            fatalError("Failed to generate URL with query parameters")
        }
        return finalURL
    }
    
//    static func getImageURL(imageName: String?) -> URL? {
//        guard let imageName = imageName else {
//            return nil
//        }
//        return URL(string: "\(Constants.baseURL)\(EndPoint.endpoint(.getFile))\(imageName)")
//    }
//    
//    static func getImageURLString(imageName: String?) -> String? {
//        guard let imageName = imageName else {
//            return nil
//        }
//        return "\(Constants.baseURL)\(EndPoint.endpoint(.getFile))\(imageName)"
//    }
}
