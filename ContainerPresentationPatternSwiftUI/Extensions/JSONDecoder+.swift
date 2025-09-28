//
//  JSONDecoder+.swift
//  ContainerPresentationPatternSwiftUI
//
//  Created by Azizbek Asadov on 28.09.2025.
//

import Foundation

extension JSONDecoder {
    static let productsDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        // Handles e.g. "2025-09-28T11:18:06.000Z"
        let iso8601fs = ISO8601DateFormatter()
        iso8601fs.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        decoder.dateDecodingStrategy = .custom { d in
            let container = try d.singleValueContainer()
            let raw = try container.decode(String.self)
            if let date = iso8601fs.date(from: raw) {
                return date
            }
            // Fallback without fractional seconds (just in case)
            let iso8601 = ISO8601DateFormatter()
            iso8601.formatOptions = [.withInternetDateTime]
            if let date = iso8601.date(from: raw) {
                return date
            }
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid ISO8601 date: \(raw)"
            )
        }
        return decoder
    }()
}
