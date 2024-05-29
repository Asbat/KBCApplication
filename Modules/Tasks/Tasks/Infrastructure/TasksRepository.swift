//
//  SportsRepository.swift
//  Tasks
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import UIKit
import Core

class TasksRepository {
    
    // MARK: Properties
    
    // MARK: Methods
    
    init() {
    }
}

// MARK: - TrafficLightRepositoryProtocol

extension TasksRepository: TrafficLightRepositoryProtocol {
    
    /// Retrieve traffic light data with a background task.
    func getTrafficLightData() throws -> Task<TrafficLight, Error> {
        return Task<TrafficLight, Error>(
            priority: .background,
            operation: {
                
                // Let's assume we retrieve the data from our backend.
                return TrafficLight(
                    red: 4.0,
                    orange: 1.0,
                    green: 4.0)
            })
    }
}
