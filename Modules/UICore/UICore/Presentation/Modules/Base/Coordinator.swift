//
//  Coordinator.swift
//  UICore
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import SwiftUI

public protocol CoordinatorDelegate: AnyObject {
    func coordinatorDidRequestDismiss(coordinator: Coordinator)
}

open class Coordinator {
    
    // MARK: Properties
    
    public weak var delegate: CoordinatorDelegate?
    
    public var childCoordinators = [Coordinator]()
    
    // MARK: Methods
    
    public init(delegate: CoordinatorDelegate?) {
        self.delegate = delegate
    }
    
    deinit {
        print("Deinit called: \(self)")
    }
    
    open func reset() {
        childCoordinators.forEach({ $0.reset() })
        childCoordinators.removeAll()
    }
    
    open func dismiss() {
        delegate?.coordinatorDidRequestDismiss(coordinator: self)
    }
}
