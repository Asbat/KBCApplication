//
//  TrafficLight.swift
//  Tasks
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import Foundation

public struct TrafficLight: TaskModel {
    public let red: Double
    public let orange: Double
    public let green: Double
    
    public init(red: Double, orange: Double, green: Double) {
        self.red = red
        self.orange = orange
        self.green = green
    }
}
