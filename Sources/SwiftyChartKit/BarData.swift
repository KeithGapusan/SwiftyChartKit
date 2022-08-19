//
//  BarData.swift
//  SwiftyChartDemo
//
//  Created by Keith Randell Gapusan on 8/17/22.
//

import Foundation
import SwiftUI

@available(iOS 14.0, *)
public struct BarData{
    public let uuid = UUID()
    public let value: Double
    public let title: String
    public let color: Color
    public init(
        value: Double,
        title: String,
        color: Color

    ) {
        self.value = value
        self.title = title
        self.color = color
        
    }
}
