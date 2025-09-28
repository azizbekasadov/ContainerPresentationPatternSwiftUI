//
//  ContentView.swift
//  ContainerPresentationPatternSwiftUI
//
//  Created by Azizbek Asadov on 28.09.2025.
//

import SwiftUI



struct ContentView: View {
    @Environment(\.apiClientService) var clientService
    
    @State private var products: [SProduct] = []
    @State private var state: LoadingState = .default
    
    var body: some View {
        Group {
            switch state {
            case .default:
                Text("No products")
            case .loading:
                ProgressView("Loading products...")
            case .success:
                List(products) { product in
                    VStack {
                        if let imageURL = product.images.first {
                            AsyncImage(url: URL(string: imageURL)) { image in
                                image.resizable()
                                    .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            } placeholder: {
                                Color.gray.opacity(0.5)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                        }

                        Text(product.title)
                        
                        Text(product.description)
                            .lineLimit(2)
                        
                        Text("Created at: " + product.creationAt.formatted())
                    }
                }
            case .failure(let error):
                Text(error.localizedDescription)
            }
        }
        .navigationTitle("Products")
        .task { @MainActor in
            do {
                self.state = .loading
                self.products = try await clientService.fetchProducts()
                
                if self.products.isEmpty {
                    self.state = .default
                } else {
                    self.state = .success
                }
                
            } catch {
                self.state = .failure(error)
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
