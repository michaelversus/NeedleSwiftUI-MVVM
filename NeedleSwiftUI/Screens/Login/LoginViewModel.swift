//
//  LoginViewModel.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 22/07/2021.
//

import Foundation

protocol LoginViewModelProtocol: ObservableObject {
    var username: String { get set }
    var password: String { get set }
    var selection: String? { get set }
    func login()
}

final class LoginViewModel: LoginViewModelProtocol {
    let dependency: LoginDependency
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var selection: String? = nil

    init(dependency: LoginDependency) {
        self.dependency = dependency
    }

    func login() {
        let user = User(
            username: username,
            password: password
        )
        if dependency.userProvider.validate(user) {
            username = ""
            password = ""
            selection = "home"
        } else {
            // show alert
        }
    }
}
