//
//  OnboardView.swift
//  DaPay
//
//  Created by Eren Kara on 12.12.2022.
//

import SwiftUI

struct OnboardView: View {
    
    @EnvironmentObject var viewModel: OnboardViewModel
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                VStack {
                    TabView {
                        viewModel.tabList[viewModel.currentIndex]
                    } // TabView
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .ignoresSafeArea()
                    
                    viewModel.nextButton(width: reader.dynamicWidth(width: 0.5), height: 46.0)
                        .padding(.bottom, 60.0)
                } // VStack
                .background(.white)
            } // GeometryReader
            .onAppear {
                viewModel.checkFirstLogin()
            }
            .navigationDestination(isPresented: $viewModel.isRedirectToAuth, destination: {
                AuthView()
                    .navigationBarBackButtonHidden()
            })
            .ignoresSafeArea()
        } // NavigationStack
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
            .environmentObject(OnboardViewModel())
    }
}

private struct Top: View {
    
    @EnvironmentObject var viewModel: OnboardViewModel
    let image: String
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Image(image)
            
            Button {
                // skip onboard
                viewModel.changeAdda()
                print("CURRENT Ş \(viewModel.currentIndex)")
            } label: {
                Text("Skip")
                    .fontWeight(.semibold)
            } // Button
        }
    }
}

private struct MidAndBottom: View {
    
    let header: String
    let content: String
    
    @EnvironmentObject var viewModel: OnboardViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0.0) {
                
                CircleModel().createCircle(listCount: 4, currentIndex: viewModel.currentIndex, width: 10.0, height: 10.0, activeColor: Color.colorPrimary, inactiveColor: Color.gray.opacity(0.2), isVerification: false)
                
                    .padding(.vertical, 30.0)
                
                Group {
                    Text(header)
                        .font(.system(size: 36.0,weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 11.0)
                        .frame(height: 150.0)
                    
                    Text(content)
                        .font(.system(size: 15.0, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                } // Group
                .padding(.horizontal, 24.0)
            } // VStack
            .frame(width: geometry.dynamicWidth(width: 1.0))
            .background(.white)
            .cornerRadius(30.0, corners: [.topLeft, .topRight])
        } // GeometryReader
    }
}

struct Tabs: View {
    
    let header: String
    let content: String
    let image: String
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                Top(image: image)
                    .frame(height: reader.dynamicHeight(height: 0.5))
                
                MidAndBottom(header: header, content: content)
            } // VStack
            .background(Color.colorOnboardBackground)
            .ignoresSafeArea(edges: [.bottom])
        }
    }
}
