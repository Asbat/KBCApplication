//
//  ModuleFactory.swift
//  KBCApplication
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import SwiftUI

class ModuleFactory {
    
    // MARK: Properties
    
    let appProvider: AppProviderProtocol
    
    // MARK: Methods
    
    init(appProvider: AppProviderProtocol) {
        self.appProvider = appProvider
    }
    
    func buildTrafficLightModule(
        delegate: TrafficLightCoordinatorDelegate?)
    -> TrafficLightCoordinator {
        return TrafficLightCoordinator(
            delegate: delegate,
            getTrafficLightUseCase: appProvider.provideGetTrafficLightUseCase())
    }
}
