//
//  TutorialView.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 23/07/2021.
//

import SwiftUI

struct TutorialView<ViewModel>: View where ViewModel: TutorialViewModelProtocol {

    @ObservedObject var viewModel: ViewModel
    let homeComponent: HomeComponentProtocol

    var body: some View {
        VStack {
            Text("Here we can demo how the app works")
            NavigationLink(
                destination: homeComponent.homeView,
                tag: "home",
                selection: $viewModel.selection) {
                EmptyView()
            }
            Button("Continue") {
                viewModel.goToHome()
            }
            .padding()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(
            viewModel: TutorialViewModel(),
            homeComponent: RootComponent().registerComponent.tutorialComponent.homeComponent
        )
    }
}
