//
//  LoginViewModel.swift
//  DaPay
//
//  Created by Eren Kara on 14.12.2022.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    
    // MARK: - Variables
    @Published var emailTextBinding = ""
    @Published var passwordTextBinding = ""
    
    @Published var isOpenKeyboard: Bool = false
    
    @Published var isSecureEmail: Bool = false
    @Published var isSecurePassword: Bool = true
    
    @Published var isRedirectToVerificationView: Bool = false
}
