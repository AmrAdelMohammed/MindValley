//
//  HomeDataSource.swift
//  MindValleyTask
//
//  Created by Amr on 04/02/2023.
//

import Foundation


protocol HomeDataSourceProtocol {
    func getChannel() async -> [Channel]?
    func getCategories() async -> [Category]?
    func getNewEpisodes() async -> [Media]?
}

class HomeDataSource:  HomeDataSourceProtocol {
    private let homeGateway: HomeGateway

    private let database: Database

    init(homeGateway: HomeGateway = AppHomeGateway(), database: Database = RealmDatabase.shared) {
        self.homeGateway = homeGateway
        self.database = database
    }
    
    func getChannel() async -> [Channel]? {
        let res = await homeGateway.getChannel()
        switch res{
        case .success(let data):
            database.deleteAllFromObject(Channel.self)
            database.saveData(data.data?.channels ?? [])
            return data.data?.channels
        case .failure(_):
            return  database.getData()//To get from DB
        }
//        return res
    }
    
    func getCategories() async -> [Category]? {
        let res = await homeGateway.getCategories()
        switch res{
        case .success(let data):
            database.deleteAllFromObject(Category.self)
            database.saveData(data.data?.categories ?? [])
            return data.data?.categories
        case .failure(_):
            return  database.getData() //To get from DB
        }
    }
    
    func getNewEpisodes() async -> [Media]? {
        let res = await homeGateway.getNewEpisodes()
        switch res{
        case .success(let data):
            database.deleteAllFromObject(Media.self)
            database.saveData(data.data?.media ?? [])
            return data.data?.media
        case .failure(_):
            return  database.getData() //To get from DB
        }
    }
}

