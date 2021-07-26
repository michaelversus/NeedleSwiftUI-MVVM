//
//  RegisterView.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 22/07/2021.
//

import SwiftUI

struct RegisterView<ViewModel>: View where ViewModel: RegisterViewModelProtocol {
    @ObservedObject var viewModel: ViewModel
    let tutorialComponent: TutorialComponentProtocol
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
            SecureField("password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
            NavigationLink(
                destination: tutorialComponent.tutorialView,
                tag: "tutorial",
                selection: $viewModel.selection
            ) {
                EmptyView()
            }
            Button("Register") {
                do {
                    try viewModel.register()
                } catch {
                    debugPrint("register error")
                }
                hideKeyboard()
            }
            .padding()
        }
        .padding()
        .navigationTitle("Register")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        let rootComponent = RootComponent()
        return RegisterView(
            viewModel: RegisterViewModel(
                dependency: rootComponent.registerComponent.dependency
            ),
            tutorialComponent: rootComponent.registerComponent.tutorialComponent
        )
    }
}
