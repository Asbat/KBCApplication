//
//  StartDrivingViewModel.swift
//  KBCApplication
//
//  Created by Alexey Stoyanov on 24.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import Foundation
import Combine
import UICore

protocol StartDrivingViewModelProtocol: ViewModel {
    var carModel: String { get set }
    var isValid: Bool { get set }
    var scene: StartDrivingViewData.Scene? { get set }
    
    func validate()
    func startDriving()
}

protocol StartDrivingViewModelDelegate: ViewModelDelegate {
    func startDrivingViewModel(_ vm: StartDrivingViewModel, didRequestStartDrivingWith carModel: String)
}

class StartDrivingViewModel: ViewModel  {
    
    enum Constants {
        static let minCarModelLength = 3
    }
    
    // MARK: Properties
    
    weak var startDrivingViewModelDelegate: StartDrivingViewModelDelegate? {
        get {
            return delegate as? StartDrivingViewModelDelegate
        }
        
        set {
            delegate = newValue
        }
    }
    
    @Published var carModel: String = ""
    @Published var isValid: Bool = false
    @Published var scene: StartDrivingViewData.Scene?
    
    // MARK: Methods
    
    override init(delegate: ViewModelDelegate?) {
        super.init(delegate: delegate)
        
        self.setupScene()
    }
}

// MARK: - Private

private extension StartDrivingViewModel {
    func setupScene() {
        scene = StartDrivingViewData.Scene(
            title: NSLocalizedString("Enter your car model:", comment: ""),
            textFieldPlaceholder: NSLocalizedString("Car Model", comment: ""),
            actionTitle: NSLocalizedString("Start Driving", comment: ""))
    }
}

// MARK: - StartDrivingViewModelProtocol

extension StartDrivingViewModel: StartDrivingViewModelProtocol {
    func validate() {
        guard carModel.count >= Constants.minCarModelLength else {       
            isValid = false
            return
        }
        
        isValid = true
    }
    
    func startDriving() {
        guard isValid else {
            alert = AlertViewData.alert(from: KBCAppError.carModelError)
            return
        }
        
        startDrivingViewModelDelegate?.startDrivingViewModel(self, didRequestStartDrivingWith: carModel)
    }
}
