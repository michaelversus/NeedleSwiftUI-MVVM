//
//  HomeView.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 23/07/2021.
//

import SwiftUI

struct HomeView<ViewModel>: View where ViewModel: HomeViewModelProtocol {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Text("Home")
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            trailing: Button("Logout") {
                if viewModel.isRootLogin() {
                    presentationMode.wrappedValue.dismiss()
                } else {
                    viewModel.presentLogin()
                }
            }
        )
        .fullScreenCover(
            isPresented: $viewModel.shouldPresentLogin) {
            // we should recreate the rootComponent here
            // because if we add loginComponent as dependency
            // then we have a circular dependency with home and login
            RootComponent().rootView
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: HomeViewModel(root: "login")
        )
    }
}
