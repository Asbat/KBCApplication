//
//  Theme.swift
//  KBCApplication
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import UIKit

struct Theme {

    // MARK: Properties
    
    static let shared = Theme(color: Color())
    
    let color: Color
}

// MARK: - Color

extension Theme {
    struct Color {
        let red = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        let green = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
        let orange = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
    }
}
