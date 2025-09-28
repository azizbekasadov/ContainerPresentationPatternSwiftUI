//
//  APIClientService.swift
//  ContainerPresentationPatternSwiftUI
//
//  Created by Azizbek Asadov on 28.09.2025.
//

import SwiftUI
import Foundation

enum APIClientError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

actor APIClientService {
    let baseURL = "https://api.escuelajs.co/api/v1/products"
    
    func fetchProducts() async throws -> [SProduct] {
        guard let url = URL(string: baseURL) else {
            throw APIClientError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (200..<300).contains((response as! HTTPURLResponse).statusCode) else {
            throw APIClientError.invalidResponse
        }
        
        let products = try await JSONDecoder.productsDecoder.decode([SProduct].self, from: data)
        return products
    }
}

extension EnvironmentValues {
    @Entry var apiClientService = APIClientService()
}
