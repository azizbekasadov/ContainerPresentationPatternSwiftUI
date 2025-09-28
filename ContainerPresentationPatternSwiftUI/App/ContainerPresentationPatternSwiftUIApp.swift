//
//  ContainerPresentationPatternSwiftUIApp.swift
//  ContainerPresentationPatternSwiftUI
//
//  Created by Azizbek Asadov on 28.09.2025.
//

import SwiftUI

@main
struct ContainerPresentationPatternSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .environment(\.apiClientService, APIClientService())
        }
    }
}
