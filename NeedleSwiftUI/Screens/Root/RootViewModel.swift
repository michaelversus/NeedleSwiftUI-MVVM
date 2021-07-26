//
//  RootViewModel.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 22/07/2021.
//

import Foundation

protocol RootViewModelProtocol: ObservableObject {
    var feature: Feature { get }
}

final class RootViewModel: RootViewModelProtocol {
    @Published var feature: Feature = .register
    let userProvider: UserProviderProtocol

    init(userProvider: UserProviderProtocol) {
        self.userProvider = userProvider
        updateFeature()
    }

    func updateFeature() {
        if userProvider.canLoadUsers() {
            feature = .login
        } else {
            feature = .register
        }
    }
}

enum Feature {
    case login // account exists
    case register // account doesn't exists
}
