//
//  AppProvider.swift
//  KBCApplication
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import Foundation
import Core
import Tasks

protocol AppProviderProtocol: AnyObject {
    func provideGetTrafficLightUseCase() -> GetTrafficLightUseCaseProtocol
}

class AppProvider {
    
    // MARK: Properties
    
    /// Private
    
    /// KBC Application providers
    private var providers = [Provider]()
    
    /// KBC business logic providers
    private let coreProvider = CoreProvider.shared
    private let tasksProvider = TasksProvider.shared
    
    // MARK: Methods
    
    init() {
        // Initialize KBC stuff
        coreProvider.add(plugin: tasksProvider)
    }

    func reset() {
        for provider in providers {
            provider.reset()
        }
        
        coreProvider.reset()
    }
}

// MARK: - AppProviderProtocol

extension AppProvider: AppProviderProtocol {
    func provideGetTrafficLightUseCase() -> GetTrafficLightUseCaseProtocol {
        return tasksProvider.provideRunTrafficLightUseCase()
    }
}
