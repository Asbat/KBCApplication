//
//  StartDrivingView.swift
//  KBCApplication
//
//  Created by Alexey Stoyanov on 24.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import SwiftUI

fileprivate enum Layout {
    enum VStack {
        static let padding: CGFloat = 10.0
    }
}

struct StartDrivingView<Model>: View where Model: StartDrivingViewModelProtocol {
    
    // MARK: Properties
    
    @ObservedObject var viewModel: Model
    
    /// Private
    @State private var showAlert: Bool = false
    
    // MARK: Body
    
    var body: some View {
        VStack {
            if let title = viewModel.scene?.title {
                Text(title)
                    .font(.headline)
                    .padding(Layout.VStack.padding)
            }
            
            TextField(viewModel.scene?.textFieldPlaceholder ?? "", text: $viewModel.carModel)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(Layout.VStack.padding)
                .onChange(of: viewModel.carModel) { _ in
                    viewModel.validate()
                }
                .padding(Layout.VStack.padding)
            
            if let actionTitle = viewModel.scene?.actionTitle {
                Button(actionTitle,
                       action: {
                    viewModel.startDriving()
                }).tint(viewModel.isValid ? .blue : .red)
            }
            
            Spacer()
        }
        .onChange(of: viewModel.alert,
                  perform: { newValue in
            showAlert = newValue != nil
        })
        .alert(isPresented: $showAlert) {
            Alert(title: Text(viewModel.alert?.title ?? ""),
                  message: Text(viewModel.alert?.body ?? ""),
                  dismissButton: .default(Text("OK")))
        }
    }
    
    // MARK: Methods

}
