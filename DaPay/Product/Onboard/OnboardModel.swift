//
//  OnboardModel.swift
//  DaPay
//
//  Created by Eren Kara on 12.12.2022.
//

import SwiftUI

struct OnboardModel: Identifiable {
    let id: UUID = UUID()
    let image: String
    let header: String
    let content: String
    
    static let dummyList: [OnboardModel] = [
        OnboardModel(image: Images.Illustration.desktop.rawValue, header: "Header", content: "Content"),
        OnboardModel(image: Images.Illustration.idea.rawValue, header: "Idea", content: "Content"),
        OnboardModel(image: Images.Illustration.social.rawValue, header: "Social", content: "Content"),
        OnboardModel(image: Images.Illustration.mobile.rawValue, header: "Mobile", content: "Content")
    ]
}
