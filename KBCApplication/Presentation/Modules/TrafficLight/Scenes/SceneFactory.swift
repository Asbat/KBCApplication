//
//  SceneFactory.swift
//  KBCApplication
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import Tasks

class SceneFactory {
    func buildStartDrivingScene(delegate: StartDrivingViewModelDelegate?) -> StartDrivingView<StartDrivingViewModel> {
        let viewModel = StartDrivingViewModel(delegate: delegate)
        return StartDrivingView(viewModel: viewModel)
    }
    
    func buildTrafficLightScene(delegate: TrafficLightViewModelDelegate?, carModel: String, getTrafficLightUseCase: GetTrafficLightUseCaseProtocol) -> TrafficLightView<TrafficLightViewModel> {
        let viewModel = TrafficLightViewModel(
            delegate: delegate,
            carModel: carModel,
            getTrafficLightUseCase: getTrafficLightUseCase)
        
        return TrafficLightView(viewModel: viewModel)
    }
}
