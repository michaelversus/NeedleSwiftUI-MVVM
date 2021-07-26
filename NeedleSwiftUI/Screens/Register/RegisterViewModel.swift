//
//  RegisterViewModel.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 22/07/2021.
//

import Foundation

protocol RegisterViewModelProtocol: ObservableObject {
    var username: String { get set }
    var password: String { get set }
    var selection: String? { get set }
    func register() throws
}

final class RegisterViewModel: RegisterViewModelProtocol {
    let dependency: RegisterDependency
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var selection: String? = nil
    
    init(dependency: RegisterDependency) {
        self.dependency = dependency
    }

    func register() throws {
        let user = User(
            username: username,
            password: password
        )
        try dependency.userProvider.save(user)
        selection = "tutorial"
    }
}
