//
//  TrafficLightView.swift
//  KBCApplication
//
//  Created by Alexey Stoyanov on 24.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import SwiftUI

fileprivate enum Layout {
    enum VStack {
        static let padding: CGFloat = 10.0
        
        enum Circle {
            static let size = CGSize(width: 100.0, height: 100.0)
        }
    }
}

struct TrafficLightView<Model>: View where Model: TrafficLightViewModelProtocol {
    
    // MARK: Properties
    
    @ObservedObject var viewModel: Model
    
    // MARK: Methods
    
    var body: some View {
        VStack {
            Text(viewModel.carModel)
                .font(.title)
                .padding(Layout.VStack.padding)
            
            VStack {
                Circle()
                    .fill(Color(Theme.shared.color.red))
                    .frame(width: Layout.VStack.Circle.size.width, height: Layout.VStack.Circle.size.height)
                    .opacity(viewModel.trafficLightState.red ? 1.0 : 0.1)
                
                Circle()
                    .fill(Color(Theme.shared.color.orange))
                    .frame(width: Layout.VStack.Circle.size.width, height: Layout.VStack.Circle.size.height)
                    .opacity(viewModel.trafficLightState.orange ? 1.0 : 0.1)
                
                Circle()
                    .fill(Color(Theme.shared.color.green))
                    .frame(width: Layout.VStack.Circle.size.width, height: Layout.VStack.Circle.size.height)
                    .opacity(viewModel.trafficLightState.green ? 1.0 : 0.1)
            }
            .background(Color.black)
            
            Spacer()
        }
        .onAppear(perform: {
            viewModel.start()
        })
    }
}
