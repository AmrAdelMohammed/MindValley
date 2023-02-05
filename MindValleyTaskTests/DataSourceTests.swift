//
//  DataSourceTests.swift
//  MindValleyTaskTests
//
//  Created by Youssef on 05/02/2023.
//

import XCTest
import Combine
@testable import MindValleyTask

final class DataSourceTests: XCTestCase {

    private var gateway: HomeGatewayMock!
    private var sut: HomeDataSource!
    private var apiRequestWillSuccess = true
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        self.gateway = HomeGatewayMock()
        gateway.shouldSuccess = apiRequestWillSuccess
        let coreDataManager = CoreDataStackManager(saveToDisk: false)
        let localDataSource = AppHomeLocalDataSource(dataBaseManager: coreDataManager)
        sut = HomeDataSource(homeGateway: gateway,
                             localDataSource: localDataSource)
    }
    
    override func tearDownWithError() throws {
        gateway = nil
        sut = nil
    }
    
    func testCategoriesSave() async {
        let categories = await self.sut.getCategories()
        self.gateway.shouldSuccess = false
        let dbCategores = await self.sut.getCategories()
        print("ANSARY", categories!.count)
        XCTAssertEqual(categories!.count, dbCategores!.count)
    }
}
