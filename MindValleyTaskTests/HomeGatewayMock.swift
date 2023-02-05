//
//  HomeGatewayMock.swift
//  MindValleyTaskTests
//
//  Created by Youssef on 05/02/2023.
//

@testable import MindValleyTask

class HomeGatewayMock: HomeGateway {

    var shouldSuccess = true

    func getNewEpisodes() async -> Result<NewEpisodesModel, Error> {
        if shouldSuccess {
            return .success(NewEpisodesModel(data: NewEpisodesModelData(media: [Media(type: "type",
                                                                                      title: "title",
                                                                                      coverAsset: "coverAsset",
                                                                                      channel: "channel")])))
        } else {
            return .failure(APIError.unknown)
        }
    }
    
    func getChannel() async -> Result<ChannelModel, Error> {
        if shouldSuccess {
            return .success(ChannelModel(data: ChannelData(channels: [Channel(title: "title",
                                                                              series: nil,
                                                                              mediaCount: 1,
                                                                              latestMedia: nil,
                                                                              id: "id",
                                                                              iconAsset: nil,
                                                                              coverAsset: nil,
                                                                              slug: "slug")])))
        } else {
            return .failure(APIError.unknown)
        }
    }
    
    func getCategories() async -> Result<CategoryModel, Error> {
        if shouldSuccess {
            return .success(CategoryModel(data: CategoryData(categories: [Category(name: "name")])))
        } else {
            return .failure(APIError.unknown)
        }
    }
}
