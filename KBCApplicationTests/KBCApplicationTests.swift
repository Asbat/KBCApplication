//
//  KBCApplicationTests.swift
//  KBCApplicationTests
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

@testable import KBCApplication_Dev
import XCTest

class KBCApplicationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        testCarModelValidation()
    }
    
    func testCarModelValidation() {
        let viewModel = StartDrivingViewModel(delegate: nil)
        
        viewModel.carModel = "B"
        viewModel.validate()
        XCTAssertFalse(viewModel.isValid)
        
        viewModel.carModel = "BM"
        viewModel.validate()
        XCTAssertFalse(viewModel.isValid)
        
        viewModel.carModel = "BMW"
        viewModel.validate()
        XCTAssertTrue(viewModel.isValid)
    }
    
    func testStartDrivingScene() {
        let viewModel = StartDrivingViewModel(delegate: nil)
        
        _ = viewModel.scene.publisher.sink { _ in
            
        } receiveValue: { viewData in
            XCTAssert(viewData.textFieldPlaceholder == NSLocalizedString("Car Model", comment: ""))
            XCTAssert(viewData.title == NSLocalizedString("Enter your car model:", comment: ""))
            XCTAssert(viewData.actionTitle == NSLocalizedString("Start Driving", comment: ""))
        }
    }
    
    func testTrafficLightSystem() {
        let carModel = "BMW"
        let useCaseMock = GetTrafficLightUseCaseMock()
        
        let viewModel = TrafficLightViewModel(
            delegate: nil,
            carModel: carModel,
            getTrafficLightUseCase: useCaseMock)
        
        XCTAssert(viewModel.carModel == carModel)
        
        // Test initial state
        XCTAssertEqual(viewModel.trafficLightState.red, false)
        XCTAssertEqual(viewModel.trafficLightState.green, false)
        XCTAssertEqual(viewModel.trafficLightState.orange, false)
        
        viewModel.start()
        
        Task {
            try? await Task.sleep(nanoseconds: 4*1_000_000_000)
            
            XCTAssertEqual(viewModel.trafficLightState.red, false)
            XCTAssertEqual(viewModel.trafficLightState.green, false)
            XCTAssertEqual(viewModel.trafficLightState.orange, true)
            
            try? await Task.sleep(nanoseconds: 1*1_000_000_000)
            
            XCTAssertEqual(viewModel.trafficLightState.red, false)
            XCTAssertEqual(viewModel.trafficLightState.green, true)
            XCTAssertEqual(viewModel.trafficLightState.orange, false)
            
            try? await Task.sleep(nanoseconds: 4*1_000_000_000)
            
            XCTAssertEqual(viewModel.trafficLightState.red, true)
            XCTAssertEqual(viewModel.trafficLightState.green, false)
            XCTAssertEqual(viewModel.trafficLightState.orange, false)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
