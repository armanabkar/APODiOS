//
//  WebService.swift
//  APOD
//
//  Created by Arman Abkar on 2/26/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

protocol API {
    func fetchAPOD(for date: String) async throws -> APOD
}

final class WebService: API {
    
    static let shared = WebService()
    private init() {}
    private var cache = NSCache<AnyObject, AnyObject>()

    func fetchAPOD(for date: String) async throws -> APOD {
        guard let url = URL(string: K.baseURL(date)) else { throw NetworkError.badURL }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.noData }
        
        guard let decodedAPOD = try? JSONDecoder().decode(APOD.self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return decodedAPOD
    }
    
}
