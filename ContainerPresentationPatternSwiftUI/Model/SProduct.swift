//
//  SProduct.swift
//  ContainerPresentationPatternSwiftUI
//
//  Created by Azizbek Asadov on 28.09.2025.
//

import Foundation

struct SProduct: Identifiable, Decodable {
    let id: Int
    let title: String
    let slug: String
    let price: Int
    let description: String
    let images: [String]
    let category: Category
    let creationAt: Date
    let updatedAt: Date
}

struct Category: Identifiable, Decodable {
    let id: Int
    let name: String
    let slug: String
    let image: String
    let creationAt: Date
    let updatedAt: Date
}

