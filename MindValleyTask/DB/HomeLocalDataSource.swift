//
//  HomeLocalDataSource.swift
//  MindValleyTask
//
//  Created by Youssef on 05/02/2023.
//

import Foundation

protocol HomeLocalDataSource {
    func getCategories() -> [Category]
    func getChannels() -> [Channel]
    func getNewEpisodes() -> [Media]
    func saveEpisodes(_ episodes: [Media])
    func deleteAllEpisodes()
    func saveCategory(_ categories: [Category])
    func deleteAllCategories()
    func saveChannels(_ channels: [Channel])
    func deleteAllChannels()
}

class AppHomeLocalDataSource: HomeLocalDataSource {
    
    private let dataBaseManager: DataBaseManager
    private let decodingService: DecodingService
    
    init(dataBaseManager: DataBaseManager = CoreDataStackManager(),
         decodingService: DecodingService = AppDecodingService()) {
        self.dataBaseManager = dataBaseManager
        self.decodingService = decodingService
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
    
    func getChannels() -> [Channel] {
        do {
            let Channels = try self.dataBaseManager.fetch(query: ChannelsEntity.fetchRequest(),
                                                      output: ChannelsEntity.self)
            return Channels.map {
                let series: [Series]? = decodingService.decodeReturningNilOnFailure(Data(referencing:$0.series),to: [Series].self)
                let latestMedia: [LatestMedia]? = decodingService.decodeReturningNilOnFailure(Data(referencing:$0.latestMedia),to: [LatestMedia].self)
                Channel(title: $0.title, series: series, mediaCount: Int($0.mediaCount ?? "0"), latestMedia: latestMedia, id: $0.id, iconAsset: IconAsset(thumbnailURL: $0.thumbnailURLIcon, url: $0.urlIcon), coverAsset: $0.coverAsset, slug: $0.slug)
            }
        } catch {
            return []
        }
    }
    
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
    
    func saveChannels(_ channels: [Channel]) {
        let channels = channels.map {
            let series: NSData = NSData(data: decodingService.encodeReturningNilOnFailure($0.series) ?? Data())
            let latestMedia: NSData = NSData(data: decodingService.encodeReturningNilOnFailure($0.latestMedia) ?? Data())
            return ChannelsEntity.create(dbManager: dataBaseManager,
                                         title: $0.title,mediaCount: "\($0.mediaCount ?? 0)",
                                         coverAsset: $0.coverAsset?.url,
                                         id: $0.id,
                                         slug: $0.slug,
                                         series: series, latestMedia: latestMedia,
                                         thumbnailURLIcon: $0.iconAsset?.thumbnailURL, urlIcon: $0.iconAsset?.url)
        }
        self.dataBaseManager.insert(data: channels,
                                    entity: "ChannelsEntity")
    }
    
    func deleteAllEpisodes() {
        self.dataBaseManager.deleteAll(entityName: "EpisodeEntity")
    }
    
    func deleteAllCategories() {
        self.dataBaseManager.deleteAll(entityName: "CategoryEntity")
    }
    
    func deleteAllChannels() {
        self.dataBaseManager.deleteAll(entityName: "ChannelsEntity")
    }
}
