//
//  CorePlugin.swift
//  Core
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import Foundation

public protocol CorePlugin: Resettable {
    func setup(with config: PluginConfig)
}

public protocol PluginConfig {
    
}
