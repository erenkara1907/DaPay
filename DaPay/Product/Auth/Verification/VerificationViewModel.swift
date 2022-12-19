//
//  VerificationViewModel.swift
//  DaPay
//
//  Created by Eren Kara on 15.12.2022.
//

import SwiftUI

final class VerificationViewModel: ObservableObject {
    
    // MARK: - Variables
    @Published var number: String = ""
    @Published var tempList: [Int] = []
    @Published var numberList: [Int] = []
    @Published var numberAndIcons = ["1","2","3","4","5","6","7","8","9","0",".",AppleIcons.deleteLeft.rawValue]
    
    @Published var circleStruct: [CircleStruct] = [CircleStruct(),CircleStruct(),CircleStruct(),CircleStruct()]
    @Published var counter: Int = 0
}
