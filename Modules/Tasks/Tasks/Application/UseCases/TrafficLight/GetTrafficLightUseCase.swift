//
//  GetTrafficLightUseCase.swift
//  Tasks
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import Foundation

public protocol GetTrafficLightUseCaseProtocol: TaskUseCase {
    func execute() throws -> Task<TrafficLight, Error>
}

class GetTrafficLightUseCase {
    
    // MARK: Properties
    
    let trafficLightRepository: TrafficLightRepositoryProtocol
    
    /// Private
    
    
    // MARK: Methods
    
    init(trafficLightRepository: TrafficLightRepositoryProtocol) {
        self.trafficLightRepository = trafficLightRepository
    }
}

// MARK: - GetTrafficLightUseCaseProtocol

extension GetTrafficLightUseCase: GetTrafficLightUseCaseProtocol {
    public func execute() throws -> Task<TrafficLight, Error> {
        return try trafficLightRepository.getTrafficLightData()
    }
}
