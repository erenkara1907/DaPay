//
//  LoginView.swift
//  DaPay
//
//  Created by Eren Kara on 14.12.2022.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel = .init()
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                VStack(spacing: 0.0) {
                    Group {
                        Text("Welcome Back!")
                            .font(.system(size: 25.0, weight: .semibold))
                            .padding(.bottom, 48.0)
                        
                        if keyboardResponder.currentHeight == 0 {
                            Images.Illustration.login.rawValue.image()
                        }
                    } // Group
                    
                    VStack(spacing: 0.0) {
                        Spacer()
                            .frame(height: 40.0)
                        
                        Group {
                            CustomTextField(isSecure: viewModel.isSecureEmail, text: $viewModel.emailTextBinding, promptText: "Email address",paddingBottom: 20.0)
                            
                            CustomTextField(isSecure: viewModel.isSecurePassword, text: $viewModel.passwordTextBinding, promptText: "Password")
                                .ignoresSafeArea(.keyboard, edges: .bottom)
                            
                            HStack {
                                Spacer()
                                Button {
                                    // some code
                                } label: {
                                    Text("Forgot your password?")
                                        .bold()
                                } // Button
                            } // HStack
                            
                            Spacer()
                            
                            Button {
                                // some code
                                viewModel.isRedirectToVerificationView.toggle()
                            } label: {
                                Text("Login")
                                    .frame(width: 230.0, height: 46.0)
                                    .foregroundColor(.white)
                                    .bold()
                                    .background(
                                        RoundedRectangle(cornerRadius: 30.0)
                                    )
                            } // Button
                            .padding(.bottom, 16.0)
                            .padding(.top, 60.0)
                            
                            Text("Don't have an account **[Sign Up](wwww.google.com)**")
                            
                            Spacer()
                        } // Group
                        .padding(.horizontal, 24.0)
                    } // Group
                    .frame(width: reader.dynamicWidth(width: 1.0), height: reader.dynamicHeight(height: 0.6))
                    .background(Color.white.cornerRadius(30.0, corners: [.topLeft, .topRight]))
                    
                } // VStack
                .frame(width: reader.dynamicWidth(width: 1.0), height: reader.dynamicHeight(height: 1.0))
                .background(Color.colorOnboardBackground)
                .offset(y: -keyboardResponder.currentHeight * 0.3)
            } // GeometryReader
            .ignoresSafeArea(edges: [.bottom])
            .navigationDestination(isPresented: $viewModel.isRedirectToVerificationView, destination: {
                VerificationView()
                    .navigationBarBackButtonHidden()
            })
        } // NavigationStack
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

private struct CustomTextField: View {
    
    @State var isSecure: Bool
    
    var text: Binding<String>
    var promptText: String
    var paddingBottom: Double = 0.0
    
    var body: some View {
        Group {
            if isSecure {
                HStack {
                    SecureField("", text: text, prompt: Text(promptText).foregroundColor(.black.opacity(0.7)))
                    
                    Button {
                        isSecure.toggle()
                    } label: {
                        AppleIcons.eyeSlash.rawValue.icon()
                            .foregroundColor(.gray)
                    } // Button
                } // HStack
                Divider()
                    .padding(.bottom, paddingBottom)
            } else {
                HStack {
                    TextField("", text: text, prompt: Text(promptText).foregroundColor(.black.opacity(0.7)))
                    
                    Button {
                        isSecure.toggle()
                    } label: {
                        AppleIcons.eye.rawValue.icon()
                            .foregroundColor(.gray)
                    } // Button
                } // HStack
                Divider()
                    .padding(.bottom, paddingBottom)
            }
        } // Group
        .padding(.bottom, 7.5)
    }
}
