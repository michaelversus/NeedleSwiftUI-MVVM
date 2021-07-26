//
//  RegisterComponent.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 22/07/2021.
//

import NeedleFoundation
import SwiftUI

protocol RegisterComponentProtocol {
    var registerView: AnyView { get }
}

protocol RegisterDependency: Dependency {
    var userProvider: UserProviderProtocol { get }
}

final class RegisterComponent: Component<RegisterDependency>, RegisterComponentProtocol {

    var registerViewModel: RegisterViewModel {
        RegisterViewModel(dependency: dependency)
    }

    var registerView: AnyView {
        AnyView(
            RegisterView(
                viewModel: registerViewModel,
                tutorialComponent: tutorialComponent
            )
        )
    }

    var tutorialComponent: TutorialComponent {
        TutorialComponent(parent: self)
    }
}
