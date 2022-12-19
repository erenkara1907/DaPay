//
//  DynamicSize+GeometryProxy.swift
//  DaPay
//
//  Created by Eren Kara on 12.12.2022.
//

import SwiftUI

extension GeometryProxy {
    /// Dynamic height by device
    /// - Parameter height: Percent value
    /// - Returns: Calculated value for device height
    func dynamicHeight(height: Double) -> Double {
        return size.height * height
    }

    /// Dynamic width by device
    /// - Parameter width: Percent value
    /// - Returns: Calculated value for device width
    func dynamicWidth(width: Double) -> Double {
        return size.width * width
    }
}
