//
//  AuthView.swift
//  DaPay
//
//  Created by Eren Kara on 14.12.2022.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject private var viewModel: AuthViewModel = .init()
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                VStack(spacing: 0.0) {
                    Spacer()
                    
                    Group {
                        Images.Auth.logo.rawValue.image()
                            .padding(.bottom, 29.0)
                        
                        Text("Welcome to")
                            .font(.system(size: 25.0, weight: .regular))
                            .foregroundColor(.white)
                            .padding(.bottom, 5.0)
                        
                        Text("WHOLLET")
                            .font(.system(size: 32.0, weight: .semibold))
                            .foregroundColor(.white)
                    } // Group
                    
                    Spacer()
                    
                    Group {
                        viewModel.login()
                        viewModel.register()
                    }  // Group
                    
                } // VStack
                .frame(width: reader.dynamicWidth(width: 1.0), height: reader.dynamicHeight(height: 1.0))
                .background(.blue)
            } // GeometryReader
            .navigationDestination(isPresented: $viewModel.isRedirectToLogin, destination: {
                LoginView()
                    .navigationBarBackButtonHidden()
            })
            .navigationDestination(isPresented: $viewModel.isRedirectToRegister, destination: {
                Text("ada")
            })
        } // NavigationStack
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
