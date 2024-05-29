//
//  Error+KBCApplication.swift
//  KBCApplication
//
//  Created by Alexey Stoyanov on 25.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import Foundation

enum KBCAppError: Error, LocalizedError {
    case general(error: Error)
    case error(code: Int, localizedDescription: String)
    case carModelError
    
    var errorDescription: String? {
        switch self {
            
        case .general(let error):
            return error.localizedDescription
            
        case .error(_, let localizedDescription):
            return localizedDescription
            
        case .carModelError:
            return NSLocalizedString("Car model must be at least 3 characters long!", comment: "")
        }
    }
}
