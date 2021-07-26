//
//  HomeComponent.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 23/07/2021.
//

import NeedleFoundation
import SwiftUI

protocol HomeComponentProtocol {
    var homeView: AnyView { get }
}

final class HomeComponent: Component<EmptyDependency>, HomeComponentProtocol {
    let root: String

    init(root: String, parent: Scope) {
        self.root = root
        super.init(parent: parent)
    }

    var homeViewModel: HomeViewModel {
        return HomeViewModel(root: root)
    }

    var homeView: AnyView {
        AnyView(
            HomeView(
                viewModel: homeViewModel
            )
        )
    }
}
