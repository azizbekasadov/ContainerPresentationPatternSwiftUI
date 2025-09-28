//
//  LoadingState.swift
//  ContainerPresentationPatternSwiftUI
//
//  Created by Azizbek Asadov on 29.09.2025.
//

import Foundation

enum LoadingState {
    case `default`
    case loading
    case success
    case failure(Error)
}
