//
//  TutorialViewModel.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 23/07/2021.
//

import Foundation

protocol TutorialViewModelProtocol: ObservableObject {
    var selection: String? { get set }
    func goToHome()
}

final class TutorialViewModel: TutorialViewModelProtocol {
    @Published var selection: String? = nil

    func goToHome() {
        selection = "home"
    }
}
