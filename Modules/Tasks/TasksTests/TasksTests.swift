//
//  TasksTests.swift
//  TasksTests
//
//  Created by Alexey Stoyanov on 22.05.24.
//  Copyright © 2024 Alexey Stoyanov. All rights reserved.
//

import XCTest
@testable import Tasks

class ContentTests: XCTestCase {
    
    // MARK: Properties
    
    let repository = TasksRepositoryMock()
    var getTrafficLightUseCase: GetTrafficLightUseCaseProtocol!
    
    // MARK: Methods

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        getTrafficLightUseCase = GetTrafficLightUseCase(trafficLightRepository: repository)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetTrafficLight() {
        Task {
            do {
                let task = try getTrafficLightUseCase.execute()
                let trafficLight = try await task.value
                
                XCTAssert(trafficLight.green == 4.0)
                XCTAssert(trafficLight.red == 4.0)
                XCTAssert(trafficLight.orange == 1.0)
            } catch(let error) {
                XCTFail("Status code: \(error.localizedDescription)")
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
