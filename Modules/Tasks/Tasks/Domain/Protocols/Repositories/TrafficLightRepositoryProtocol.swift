//
//  TrafficLightRepositoryProtocol.swift
//  Tasks
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import Foundation

protocol TrafficLightRepositoryProtocol {
    func getTrafficLightData() throws -> Task<TrafficLight, Error>
}
