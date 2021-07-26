//
//  LoginComponent.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 22/07/2021.
//

import NeedleFoundation
import SwiftUI

protocol LoginComponentProtocol {
    var loginView: AnyView { get }
}

protocol LoginDependency: Dependency {
    var userProvider: UserProviderProtocol { get }
}

final class LoginComponent: Component<LoginDependency>, LoginComponentProtocol {

    var loginViewModel: LoginViewModel {
        LoginViewModel(dependency: dependency)
    }

    var loginView: AnyView {
        AnyView(
            LoginView(
                viewModel: loginViewModel,
                homeComponent: homeComponent
            )
        )
    }

    var homeComponent: HomeComponent {
        HomeComponent(root: "login", parent: self)
    }
}
