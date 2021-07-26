//
//  RootView.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 22/07/2021.
//

import SwiftUI

struct RootView<ViewModel>: View where ViewModel: RootViewModelProtocol {
    @ObservedObject var viewModel: ViewModel
    let registerComponent: RegisterComponentProtocol
    let loginComponent: LoginComponentProtocol

    var body: some View {
        NavigationView {
            switch viewModel.feature {
            case .register:
                registerComponent.registerView
            case .login:
                loginComponent.loginView
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {

    static var previews: some View {
        let rootComponent = RootComponent()
        return RootView(
            viewModel: RootViewModel(
                userProvider: rootComponent.userProvider
            ),
            registerComponent: rootComponent.registerComponent,
            loginComponent: rootComponent.loginComponent
        )
    }
}
