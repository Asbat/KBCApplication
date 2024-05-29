//
//  UseCaseFactory.swift
//  Tasks
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import UIKit

class UseCaseFactory {
    func buildTrafficLightSystemUseCase(
        trafficLightRepository: TrafficLightRepositoryProtocol
    ) -> GetTrafficLightUseCaseProtocol {
        return GetTrafficLightUseCase(trafficLightRepository: trafficLightRepository)
    }
}
