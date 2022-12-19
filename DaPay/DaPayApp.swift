//
//  DaPayApp.swift
//  DaPay
//
//  Created by Eren Kara on 12.12.2022.
//

import SwiftUI

@main
struct DaPayApp: App {
    @StateObject var viewModel: OnboardViewModel = OnboardViewModel()
    @StateObject var verificationViewModel: VerificationViewModel = VerificationViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(verificationViewModel)
        }
    }
}
