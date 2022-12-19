//
//  CircleModel.swift
//  DaPay
//
//  Created by Eren Kara on 12.12.2022.
//

import SwiftUI

struct CircleModel: Identifiable {
    let id: UUID = UUID()
}

extension CircleModel {
    func createCircle(
        listCount: Int,
        currentIndex: Int,
        width: Double,
        height: Double,
        activeColor: Color,
        inactiveColor: Color,
        isVerification: Bool,
        number: String = "",
        numberList: [Int] = []
    ) -> some View {
        var circleList: [CircleModel] = []
        
        for _ in 0...listCount - 1 {
            circleList.append(CircleModel())
        }
        
        return HStack {
            ForEach((0...circleList.count - 1), id: \.self) { circle in
                if isVerification {
                    Circle()
                        .frame(width: width, height: height)
                        .foregroundColor(activeColor)
                } else {
                    Circle()
                        .frame(width: width, height: height)
                        .foregroundColor(currentIndex == circle ? activeColor : inactiveColor)
                }
            }
        }
    }
}
