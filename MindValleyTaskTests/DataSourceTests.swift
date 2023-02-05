//
//  DataSourceTests.swift
//  MindValleyTaskTests
//
//  Created by Amr on 05/02/2023.
//

import XCTest
import Combine
@testable import MindValleyTask

final class DataSourceTests: XCTestCase {

    private var gateway: HomeGatewayMock!
    private var sut: HomeDataSource!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        self.gateway = HomeGatewayMock()
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
        self.gateway.shouldSuccess = true
        let data = await self.sut.getCategories()
        self.gateway.shouldSuccess = false
        let dbData = await self.sut.getCategories()
        XCTAssertEqual(data!.count, dbData!.count)
    }

    func testChannelsSave() async {
        self.gateway.shouldSuccess = true
        let data = await self.sut.getChannel()
        self.gateway.shouldSuccess = false
        let dbData = await self.sut.getChannel()
        XCTAssertEqual(data!.count, dbData!.count)
    }

    func testNewEpisodesSave() async {
        self.gateway.shouldSuccess = true
        let data = await self.sut.getNewEpisodes()
        self.gateway.shouldSuccess = false
        let dbData = await self.sut.getNewEpisodes()
        XCTAssertEqual(data!.count, dbData!.count)
    }
}
