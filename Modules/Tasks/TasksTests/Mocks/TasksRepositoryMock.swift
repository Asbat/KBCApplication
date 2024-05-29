//
//  TasksRepositoryMock.swift
//  TasksTests
//
//  Created by Alexey Stoyanov on 25.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

@testable import Tasks

// This is an example of how we can mock repositories. In our case this class will be the same as TasksRepository because we don't fetch data from our backend.
class TasksRepositoryMock: TrafficLightRepositoryProtocol {
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
