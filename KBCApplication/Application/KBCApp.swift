//
//  App.swift
//  KBCApplication
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import SwiftUI

@main
struct KBCApp: App {
    
    // MARK: Properties
    
    let appProvider: AppProvider = AppProvider()
    let coordinator: TrafficLightCoordinator
    
    var body: some Scene {
        WindowGroup {
            coordinator.start()
        }
    }
    
    // MARK: Methods
    
    init() {
        // Prepare Traffic light module
        self.coordinator = ModuleFactory(appProvider: self.appProvider)
            .buildTrafficLightModule(delegate: nil)
    }
}
