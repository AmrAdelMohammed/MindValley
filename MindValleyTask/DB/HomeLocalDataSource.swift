//
//  HomeLocalDataSource.swift
//  MindValleyTask
//
//  Created by Youssef on 05/02/2023.
//

import Foundation

protocol HomeLocalDataSource {
    func getCategories() -> [Category]
    func getChannels()
    func getNewEpisodes() -> [Media]
    func saveEpisodes(_ episodes: [Media])
    func deleteAllEpisodes()
    func saveCategory(_ categories: [Category])
    func deleteAllCategories()
}

class AppHomeLocalDataSource: HomeLocalDataSource {
    
    private let dataBaseManager: DataBaseManager
    
    init(dataBaseManager: DataBaseManager = CoreDataStackManager()) {
        self.dataBaseManager = dataBaseManager
    }
    
    func getCategories() -> [Category] {
        do {
            let categories = try self.dataBaseManager.fetch(query: CategoryEntity.fetchRequest(),
                                                      output: CategoryEntity.self)
            return categories.map {
                Category(name: $0.name)
            }
        } catch {
            return []
        }
    }
    
    func getChannels() {}
    
    func getNewEpisodes() -> [Media] {
        do {
            let episodes = try self.dataBaseManager.fetch(query: EpisodeEntity.fetchRequest(),
                                                      output: EpisodeEntity.self)
            return episodes.map {
                Media(type: $0.type,
                      title: $0.title,
                      coverAsset: $0.coverAsset,
                      channel: $0.channel)
            }
        } catch {
            return []
        }
    }
    
    func saveEpisodes(_ episodes: [Media]) {
        let episodes = episodes.map {
            return EpisodeEntity.create(dbManager: dataBaseManager,
                                        type: $0.type ?? "",
                                        title: $0.title ?? "",
                                        coverAsset: $0.coverAsset?.url,
                                        channel: $0.channel?.title)
        }
        self.dataBaseManager.insert(data: episodes,
                                    entity: "EpisodeEntity")
    }
    
    func saveCategory(_ categories: [Category]) {
        let categories = categories.map {
            return CategoryEntity.create(dbManager: dataBaseManager,
                                         name: $0.name ?? "")
        }
        self.dataBaseManager.insert(data: categories,
                                    entity: "CategoryEntity")
    }
    
    func deleteAllEpisodes() {
        self.dataBaseManager.deleteAll(entityName: "EpisodeEntity")
    }
    
    func deleteAllCategories() {
        self.dataBaseManager.deleteAll(entityName: "CategoryEntity")
    }
}
