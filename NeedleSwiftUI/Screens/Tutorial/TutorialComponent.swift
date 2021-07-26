//
//  TutorialComponent.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 23/07/2021.
//

import NeedleFoundation
import SwiftUI

protocol TutorialComponentProtocol {
    var tutorialView: AnyView { get }
}

final class TutorialComponent: Component<EmptyDependency>, TutorialComponentProtocol {

    var tutorialViewModel: TutorialViewModel {
        return TutorialViewModel()
    }

    var tutorialView: AnyView {
        AnyView(
            TutorialView(
                viewModel: tutorialViewModel,
                homeComponent: homeComponent
            )
        )
    }

    var homeComponent: HomeComponent {
        HomeComponent(root: "tutorial", parent: self)
    }
}
