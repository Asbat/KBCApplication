//
//  ContentProvider.swift
//  Tasks
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import Foundation
import Core

public protocol TasksProviderProtocol: TasksPlugin {
    func provideRunTrafficLightUseCase() -> GetTrafficLightUseCaseProtocol
}

public class TasksProvider {
    
    // MARK: Properties
    
    public static let shared: TasksProviderProtocol = TasksProvider.default
    
    /// Internal
    static let `default` = TasksProvider()
    
    /// Private
    private var config: Core.TasksConfig?
}

// MARK: - TasksPlugin

extension TasksProvider {
    public func setup(with config: Core.PluginConfig) {
        if let config = config as? Core.TasksConfig {
            self.config = config
        }
    }
    
    public func reset() {
        // Clear Tasks module's cache
    }
}

// MARK: - Provide repositories

extension TasksProvider {
    func provideTrafficLightRepository() -> TrafficLightRepositoryProtocol {
        return TasksRepository()
    }
}

// MARK: - TasksProviderProtocol

extension TasksProvider: TasksProviderProtocol {
    public func provideRunTrafficLightUseCase() -> GetTrafficLightUseCaseProtocol {
        return UseCaseFactory().buildTrafficLightSystemUseCase(trafficLightRepository: provideTrafficLightRepository())
    }
}
