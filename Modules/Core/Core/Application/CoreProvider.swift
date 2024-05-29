//
//  CoreProvider.swift
//  Core
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import Foundation

public protocol CoreProviderProtocol: Resettable {
    func add(plugin: CorePlugin)
    func remove(plugin: CorePlugin)
}

protocol CoreProviderInternalProtocol {
    
}

public class CoreProvider {
    
    // MARK: Properties
    
    public static let shared: CoreProviderProtocol = CoreProvider.default
    
    /// Internal
    static let `default` = CoreProvider()
    
    /// Private
    
    /// Plugins
    private var plugins = [CorePlugin]()
    
    // MARK: Methods

}

// MARK: - CoreProviderProtocol

extension CoreProvider: CoreProviderProtocol {
    public func reset() {
        // Clear core cache
        
        // Reset plugins
        plugins.forEach({ $0.reset() })
    }
    
    public func add(plugin: CorePlugin) {
        if let plugin = plugin as? TasksPlugin {
            plugin.setup(with: TasksConfig(/* we can provide some initial data for the Tasks module here. */))
        }
        
        if !plugins.contains(where: { $0 === plugin }) {
            plugins.append(plugin)
        }
    }
    
    public func remove(plugin: CorePlugin) {
        plugins = plugins.filter({ $0 !== plugin })
    }
}
