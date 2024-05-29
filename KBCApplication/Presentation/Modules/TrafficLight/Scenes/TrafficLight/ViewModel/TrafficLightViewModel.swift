//
//  TrafficLightViewModel.swift
//  KBCApplication
//
//  Created by Alexey Stoyanov on 24.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import Combine
import UICore
import Tasks

protocol TrafficLightViewModelProtocol: ViewModelProtocol {
    var carModel: String { get set }
    var trafficLightState: TrafficLightViewModel.TrafficLightState { get set }
    
    func start()
}

protocol TrafficLightViewModelDelegate: ViewModelDelegate {
}

class TrafficLightViewModel: ViewModel  {
    
    struct TrafficLightState {
        let red: Bool
        let green: Bool
        let orange: Bool
    }
    
    // MARK: Properties
    
    weak var trafficLightViewModelDelegate: TrafficLightViewModelDelegate? {
        get {
            return delegate as? TrafficLightViewModelDelegate
        }
        
        set {
            delegate = newValue
        }
    }
    
    @Published var trafficLightState = TrafficLightState(red: false, green: false, orange: false)
    
    var carModel: String
    let getTrafficLightUseCase: GetTrafficLightUseCaseProtocol
    
    // MARK: Methods
    
    init(delegate: ViewModelDelegate?,
         carModel: String,
         getTrafficLightUseCase: GetTrafficLightUseCaseProtocol) {
        self.carModel = carModel
        self.getTrafficLightUseCase = getTrafficLightUseCase
        super.init(delegate: delegate)
    }
}

// MARK: - Private

private extension TrafficLightViewModel {
    func change(trafficLightState: TrafficLightState, duration: Double) async {
            await MainActor.run {
                self.trafficLightState = trafficLightState
            }
            try? await Task.sleep(nanoseconds: UInt64(duration) * 1_000_000_000)
        }
}

// MARK: - TrafficLightViewModelProtocol

extension TrafficLightViewModel: TrafficLightViewModelProtocol {
    func start() {
        Task {
            do {
                let trafficLight = try await getTrafficLightUseCase.execute().value
                print("Traffic light: \(trafficLight)")
                
                while true {
                    await change(trafficLightState: TrafficLightState(red: true, green: false, orange: false), duration: trafficLight.red)
                    await change(trafficLightState: TrafficLightState(red: false, green: false, orange: true), duration: trafficLight.orange)
                    await change(trafficLightState: TrafficLightState(red: false, green: true, orange: false), duration: trafficLight.green)
                }
            } catch (let error) {
                alert = AlertViewData.alert(from: error)
            }
        }
    }
}
