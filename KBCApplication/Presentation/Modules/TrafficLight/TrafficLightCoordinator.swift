//
//  TrafficLightCoordinator.swift
//  KBCApplication
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import SwiftUI
import UICore
import Core
import Tasks

protocol TrafficLightCoordinatorDelegate: CoordinatorDelegate {
}

class TrafficLightCoordinator: Coordinator, ObservableObject {
    
    enum Route: Hashable {
        case startDriving
        case trafficLight(carModel: String)
    }
    
    // MARK: Properties
    
    weak var trafficLightDelegate: TrafficLightCoordinatorDelegate? {
        get {
            return delegate as? TrafficLightCoordinatorDelegate
        }
        
        set {
            delegate = newValue
        }
    }
    
    @Published var path: [Route] = []
    
    let getTrafficLightUseCase: GetTrafficLightUseCaseProtocol
    
    // MARK: Methods
    
    init(delegate: TrafficLightCoordinatorDelegate?,
         getTrafficLightUseCase: GetTrafficLightUseCaseProtocol) {
        self.getTrafficLightUseCase = getTrafficLightUseCase
        super.init(delegate: delegate)
    }
    
    func start() -> some View {
        return TrafficLightNavigationView(coordinator: self)
    }
    
    func buildStartDrivingScene() -> some View {
        return SceneFactory().buildStartDrivingScene(delegate: self)
    }
    
    func buildTrafficLightScene(carModel: String) -> some View {
        return SceneFactory().buildTrafficLightScene(
            delegate: self,
            carModel: carModel,
            getTrafficLightUseCase: getTrafficLightUseCase)
    }
}

// MARK: - StartDrivingViewModelDelegate

extension TrafficLightCoordinator: StartDrivingViewModelDelegate {
    func startDrivingViewModel(_ vm: StartDrivingViewModel, didRequestStartDrivingWith carModel: String) {
        // Show traffic light system
        path.append(Route.trafficLight(carModel: carModel))
    }
}

// MARK: - TrafficLightViewModelDelegate

extension TrafficLightCoordinator: TrafficLightViewModelDelegate {
}
