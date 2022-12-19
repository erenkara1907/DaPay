//
//  AuthViewModel.swift
//  DaPay
//
//  Created by Eren Kara on 14.12.2022.
//

import SwiftUI

final class AuthViewModel: ObservableObject {
    // MARK: - Variables
    @Published var isRedirectToLogin: Bool = false
    @Published var isRedirectToRegister: Bool = false
    
    // MARK: - View Functions
    @ViewBuilder
    func login() -> some View {
        Button {
            self.isRedirectToLogin = true
        } label: {
            Text("Login")
                .font(.system(size: 19.0,weight: .semibold))
                .frame(minWidth: 0.0, maxWidth: 200.0)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 30.0)
                        .stroke(.white, lineWidth: 1.0)
                        .background(Color.white.cornerRadius(30.0))
                )
        } // Button
        .padding(.bottom, 20.0)
    }
    
    @ViewBuilder
    func register() -> some View {
        Button {
            self.isRedirectToRegister = true
        } label: {
            Text("Don't have an account? **[Sign Up](www.google.com)**")
                .font(.system(size: 16.0))
                .foregroundColor(.white)
                .tint(.white)
                .padding(.bottom, 26.0)
        }
    }
}
