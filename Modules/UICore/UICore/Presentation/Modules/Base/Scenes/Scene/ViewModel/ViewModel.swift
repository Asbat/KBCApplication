//
//  ViewModel.swift
//  UICore
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import Combine

public protocol ViewModelDelegate: AnyObject {
}

public protocol ViewModelProtocol: ObservableObject {
    var alert: AlertViewData? { get }
}

open class ViewModel: ViewModelProtocol {
    
    // MARK: Properties
    
    public weak var delegate: ViewModelDelegate?
    
    @Published public var alert: AlertViewData?
    
    // MARK: Methods
    
    public init(delegate: ViewModelDelegate?) {
        self.delegate = delegate
    }
}
