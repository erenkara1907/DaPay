//
//  OnboardViewModel.swift
//  DaPay
//
//  Created by Eren Kara on 12.12.2022.
//

import SwiftUI

final class OnboardViewModel: ObservableObject {
    // MARK: - Variables
    @Published var currentIndex: Int = 0
    @State private var isDisabled: Bool = false
    @Published var adda: Bool = false
    @Published var isRedirectToAuth: Bool = false
    
    func changeAdda() {
        adda.toggle()
        print("ADDA : \(adda)")
    }
    
    @Published var tabList = [
        Tabs(header: "Welcome to\n Whollet", content: "Manage all your crypto assets! It's simple and easy!", image: Images.Illustration.desktop.rawValue),
        Tabs(header: "Nice and Tidy Crypto\nPortfolio!", content: "Keep BTC, ETH, XRP and many other ERC-20 based tokens.", image: Images.Illustration.idea.rawValue),
        Tabs(header: "Receive and Send\n Money to Friends!", content: "Send crypto to your friends with a personal message attached.", image: Images.Illustration.social.rawValue),
        Tabs(header: "Your Safety is Our\n Top Priority", content: "Our top-notch security features will keep you completely safe.", image: Images.Illustration.mobile.rawValue)
    ]
    
    // MARK: - Functions
    @ViewBuilder
    func nextButton(width: Double, height: Double) -> some View {
        Button {
            withAnimation {
                if self.currentIndex == self.tabList.count - 1 {
                    self.isRedirectToAuth = true
                    AppStorageConstant().isOpened.toggle()
                    self.isDisabled = true
                } else {
                    self.currentIndex += 1
                }
            }
        } label: {
            Text(self.currentIndex == (self.tabList.count - 1) ? "Let's Get Started" : "Next Step")
                .fontWeight(.semibold)
                .frame(minWidth: 0.0, maxWidth: .infinity)
                .padding()
                .foregroundColor(self.currentIndex == (self.tabList.count - 1) ? .white : .blue)
                .background(
                    RoundedRectangle(cornerRadius: 30.0)
                        .stroke(.blue, lineWidth: 1.0)
                        .background(self.currentIndex == (self.tabList.count - 1) ? Color.blue.cornerRadius(30.0) : Color.white.cornerRadius(30.0))
                )
        }
        .frame(width: width, height: height)
        .disabled(isDisabled)
    }
    
    func checkFirstLogin() {
        if AppStorageConstant().isOpened {
            isRedirectToAuth = true
        }
    }
}
