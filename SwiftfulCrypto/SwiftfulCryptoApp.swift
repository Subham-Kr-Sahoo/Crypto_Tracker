//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Rahul Dev Nayak on 08/09/25.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
