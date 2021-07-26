//
//  LoginView.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 22/07/2021.
//

import SwiftUI

struct LoginView<ViewModel>: View where ViewModel: LoginViewModelProtocol {
    @ObservedObject var viewModel: ViewModel
    let homeComponent: HomeComponentProtocol

    var body: some View {
        VStack(alignment: .center) {
            TextField("username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
            SecureField("password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
            NavigationLink(
                destination: homeComponent.homeView,
                tag: "home",
                selection: $viewModel.selection
            ) {
                EmptyView()
            }
            Button("Login") {
                viewModel.login()
                hideKeyboard()
            }
            .padding()
        }
        .padding()
        .navigationTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let rootComponent = RootComponent()
        return LoginView(
            viewModel: LoginViewModel(
                dependency: rootComponent.loginComponent.dependency
            ),
            homeComponent: rootComponent.loginComponent.homeComponent
        )
    }
}
