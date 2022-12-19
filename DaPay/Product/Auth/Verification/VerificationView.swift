//
//  VerificationView.swift
//  DaPay
//
//  Created by Eren Kara on 15.12.2022.
//

import SwiftUI

struct VerificationView: View {
    
    @EnvironmentObject var viewModel: VerificationViewModel
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                VStack(spacing: 0.0) {
                    Group {
                        HStack {
                            AppleIcons.chevronBackward.rawValue.icon()
                                .onTapGesture {
                                    // some code
                                }
                            
                            Spacer()
                            Text("Verification Required")
                                .font(.title)
                                .fontWeight(.semibold)
                            Spacer()
                        } // HStack
                        .padding(.horizontal, 17.0)
                        
                        Text("Please enter your PIN to proceed")
                            .padding(.top, 8.0)
                            .font(.system(size: 14.0, weight: .light))
                    } //  Group
                    
                    Spacer()
                    
                    CustomCircle()
                    
                    Spacer()
                    
                    Group {
                        HStack {
                            Number(number: viewModel.numberAndIcons[0])
                            Spacer()
                            Number(number: viewModel.numberAndIcons[1])
                            Spacer()
                            Number(number: viewModel.numberAndIcons[2])
                        } // HStack
                        .padding(.horizontal, 76.84)
                        
                        Spacer()
                            .frame(height: 37.0)
                        
                        HStack {
                            Number(number: viewModel.numberAndIcons[3])
                            Spacer()
                            Number(number: viewModel.numberAndIcons[4])
                            Spacer()
                            Number(number: viewModel.numberAndIcons[5])
                        } // HStack
                        .padding(.horizontal, 76.84)
                        
                        Spacer()
                            .frame(height: 37.0)
                        
                        HStack {
                            Number(number: viewModel.numberAndIcons[6])
                            Spacer()
                            Number(number: viewModel.numberAndIcons[7])
                            Spacer()
                            Number(number: viewModel.numberAndIcons[8])
                        } // HStack
                        .padding(.horizontal, 76.84)
                        
                        Spacer()
                            .frame(height: 37.0)
                        
                        HStack(spacing: 0.0) {
                            Number(number: viewModel.numberAndIcons[10])
                            Spacer()
                            Number(number: viewModel.numberAndIcons[9])
                            Spacer()
                            Image(systemName: viewModel.numberAndIcons[11])
                                .foregroundColor(.black.opacity(0.6))
                                .frame(width: 40.0)
                                .onTapGesture {
                                    viewModel.numberList.removeLast()
                                }
                        } // HStack
                        .padding(.horizontal, 76.84)
                    } // Group
                } // VStack
                .background(Color.colorOnboardBackground)
            } // GeometryReader
        } // NavigationStack
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
            .environmentObject(VerificationViewModel())
    }
}

struct Number: View {
    
    let number: String
    @EnvironmentObject var viewModel: VerificationViewModel
    
    @State var lastIndex: Int = 99
    
    var body: some View {
        Button {
            // some code
            withAnimation {
                if viewModel.numberList.count > 0 {
                    viewModel.tempList.removeLast()
                }
                let numberValue = Int(number) ?? 0
                viewModel.tempList.append(numberValue)
                viewModel.numberList.append(numberValue)
                
                viewModel.number = number
                
                if viewModel.counter < 4 {
                    viewModel.circleStruct[viewModel.counter].value = true
                    viewModel.counter += 1
                }
            }
        } label: {
            Text(number)
                .padding()
                .font(.largeTitle)
                .foregroundColor(.black.opacity(0.6))
                .background(viewModel.tempList.contains(Int(number) ?? -1) ? .white : Color.colorOnboardBackground)
                .clipShape(Circle())
        }
    }
}

struct CustomCircle: View {
    
    @EnvironmentObject var viewModel: VerificationViewModel
    
    var body: some View {
        HStack {
            ForEach(0...3, id: \.self) { circle in
                viewModel.circleStruct[circle]
            } // ForEach
        } // HStack
    }
    
    func getBool(circle: Int) -> Bool {
        if circle == viewModel.numberList.count - 1 {
            return true
        } else {
            return false
        }
    }
}

struct CircleStruct: View {
    
    var value: Bool = false
    
    var body: some View {
        Circle()
            .frame(width: 22.0, height: 22.0)
            .foregroundColor(value == true ? Color.colorActiveCircleColor : .gray.opacity(0.2))
    }
}
