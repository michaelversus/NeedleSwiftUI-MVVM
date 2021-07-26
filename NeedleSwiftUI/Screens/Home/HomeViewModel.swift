//
//  HomeViewModel.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 23/07/2021.
//

import Foundation

protocol HomeViewModelProtocol: ObservableObject {
    var selection: String? { get set }
    var shouldPresentLogin: Bool { get set }
    func isRootLogin() -> Bool
    func presentLogin()
}

final class HomeViewModel: HomeViewModelProtocol {
    @Published var selection: String? = nil
    @Published var shouldPresentLogin: Bool = false
    let root: String

    init(root: String) {
        self.root = root
    }

    func presentLogin() {
        shouldPresentLogin = true
    }

    func isRootLogin() -> Bool {
        root == "login"
    }
}
