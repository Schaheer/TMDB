//
//  NetworkManager.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Alamofire

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingError
    case noNetwork

    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "")
        case .requestFailed:
            return NSLocalizedString("Request failed", comment: "")
        case .invalidResponse:
            return NSLocalizedString("Invalid response", comment: "")
        case .decodingError:
            return NSLocalizedString("Decoding error", comment: "")
        case .noNetwork:
            return NSLocalizedString("No Internet", comment: "")
        }
    }
}

extension Error {
    var code: Int {
        return (self as NSError).code
    }
}

class NetworkManager {
    static func isConnectedToNetwork() async -> Bool {
        let networkReachability = NetworkReachabilityManager()
        return networkReachability?.isReachable ?? false
    }
    
    func request<T: Decodable>(
        method: HTTPMethod,
        url: String,
        headers: [String: String],
        params: Parameters?,
        of type: T.Type
    ) async throws -> T {
        // Set Encoding
        var encoding: ParameterEncoding = JSONEncoding.default
        switch method {
        case .post:
            encoding = JSONEncoding.default
        case .get:
            encoding = URLEncoding.default
        default:
            encoding = JSONEncoding.default
        }

        // You must resume the continuation exactly once
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                url,
                method: method,
                parameters: params,
                encoding: encoding,
                headers: HTTPHeaders(headers)
            ).responseDecodable(of: type) { response in
                switch response.result {
                case let .success(data):
                    continuation.resume(returning: data)

                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
