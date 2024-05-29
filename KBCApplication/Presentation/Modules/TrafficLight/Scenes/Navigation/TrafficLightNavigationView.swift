//
//  TrafficLightNavigationView.swift
//  KBCApplication
//
//  Created by Alexey Stoyanov on 25.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import SwiftUI

struct TrafficLightNavigationView: View {
    
    @StateObject var coordinator: TrafficLightCoordinator

    // MARK: Properties
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.buildStartDrivingScene()
                .navigationDestination(for: TrafficLightCoordinator.Route.self) { route in
                    switch route {
                    case .startDriving:
                        coordinator.buildStartDrivingScene()
                        
                    case .trafficLight(let carModel):
                        coordinator.buildTrafficLightScene(carModel: carModel)
                    }
                }
        }
    }
}
