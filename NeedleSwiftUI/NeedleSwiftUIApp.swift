//
//  NeedleSwiftUIApp.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 22/07/2021.
//

import SwiftUI
import NeedleFoundation

@main
struct NeedleSwiftUIApp: App {

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            RootComponent().rootView
        }
    }
}
