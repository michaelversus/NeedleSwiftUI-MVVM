//
//  RootComponent.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 22/07/2021.
//

import NeedleFoundation
import SwiftUI

final class RootComponent: BootstrapComponent {
    var userDefaults: UserDefaults {
        UserDefaults.standard
    }

    var userProvider: UserProviderProtocol {
        shared { UserProvider(userDefaults: userDefaults) }
    }

    var rootViewModel: RootViewModel {
        RootViewModel(userProvider: userProvider)
    }

    var rootView: some View {
        RootView(
            viewModel: rootViewModel,
            registerComponent: registerComponent,
            loginComponent: loginComponent
        )
    }

    var registerComponent: RegisterComponent {
        RegisterComponent(parent: self)
    }

    var loginComponent: LoginComponent {
        LoginComponent(parent: self)
    }
}
