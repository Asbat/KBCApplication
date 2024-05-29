//
//  ViewData.swift
//  UICore
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import SwiftUI

public protocol ViewData {

}

public struct AlertViewData: ViewData {
    public struct Item: ViewData {
        public let title: String
        public let handler: (() -> Void)?
        
        public init(title: String, handler: (() -> Void)? = nil) {
            self.title = title
            self.handler = handler
        }
    }
    
    public let title: String?
    public let body: String?
    public let items: [Item]
    
    public init(title: String?, body: String?, items: [Item] = [Item(title: NSLocalizedString("OK", comment: ""))]) {
        self.title = title
        self.body = body
        self.items = items
    }
    
    public static func alert(from error: Error?) -> AlertViewData {
        return AlertViewData(
            title: NSLocalizedString("Oops!", comment: ""),
            body: error?.localizedDescription ?? NSLocalizedString("Your request could not be made at this time. Please check your Internet connection and try again later.", comment: ""))
    }
}

// MARK: - Equatable

extension AlertViewData: Equatable {
    public static func == (lhs: AlertViewData, rhs: AlertViewData) -> Bool {
        return lhs.title == rhs.title && lhs.body == rhs.body
    }
}
