//
//  MindValleyTaskTests.swift
//  MindValleyTaskTests
//
//  Created by Amr on 29/01/2023.
//

import XCTest
import Combine
@testable import MindValleyTask

final class ViewModelTests: XCTestCase {

    private var sut: HomeVM!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        let gateway = HomeGatewayMock()
        gateway.shouldSuccess = true
        let coreDataManager = CoreDataStackManager(saveToDisk: false)
        let localDataSource = AppHomeLocalDataSource(dataBaseManager: coreDataManager)
        let dataSource = HomeDataSource(homeGateway: gateway,
                                        localDataSource: localDataSource)
        sut = HomeVM(homeDataSource: dataSource)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFetchData() {
        let expectation = self.expectation(description: "Waiting Response")
        expectation.expectedFulfillmentCount = 3
        sut.$newEpisodes.dropFirst().sink { data in
            XCTAssertFalse(data.isEmpty)
            expectation.fulfill()
        }.store(in: &cancellables)
        sut.$channels.dropFirst().sink { data in
            XCTAssertFalse(data.isEmpty)
            expectation.fulfill()
        }.store(in: &cancellables)
        sut.$categories.dropFirst().sink { data in
            XCTAssertFalse(data.isEmpty)
            expectation.fulfill()
        }.store(in: &cancellables)
        waitForExpectations(timeout: 3, handler: nil)
    }
}
