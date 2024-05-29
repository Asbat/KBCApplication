//
//  GetTrafficLightUseCaseMock.swift
//  KBCApplicationTests
//
//  Created by Alexey Stoyanov on 29.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import Tasks

class GetTrafficLightUseCaseMock: GetTrafficLightUseCaseProtocol {
    func execute() throws -> Task<Tasks.TrafficLight, any Error> {
        return Task<TrafficLight, Error>(
            priority: .background,
            operation: {
                return TrafficLight(
                    red: 4.0,
                    orange: 1.0,
                    green: 4.0)
            })
    }
}
