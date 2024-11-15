//
//  APIService.swift
//  ChimpTest
//
//  Created by Alireza Zahedi on 2024-11-15.
//

import Foundation

enum NetworkingError: Error {
    case invalidURL
    case unexpectedStatusCode(Int)
    case encodingFailed
    case unexpectedError(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .unexpectedStatusCode(let code):
            return "Unexpected status code: \(code)"
        case .encodingFailed:
            return "Encoding failed"
        case .unexpectedError(let error):
            return error.localizedDescription
        }
    }
}

class APIService {
    static let BASE_URL = "https://localhost:8080"
    
    static func sendUserScore(score: ClassicScore) async throws -> Void {
        guard let data = try? JSONEncoder().encode(score) else { throw NetworkingError.encodingFailed }
        guard let url = URL(string: "<URL_TO_SERVER>") else { throw NetworkingError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        
        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode < 200 ||
                httpResponse.statusCode >= 300 { throw NetworkingError.unexpectedStatusCode(httpResponse.statusCode) }
        } catch(let error){
            throw NetworkingError.unexpectedError(error)
        }
    }
}
