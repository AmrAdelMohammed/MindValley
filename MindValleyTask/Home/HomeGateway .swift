//
//  Gateway.swift
//  MindValleyTask
//
//  Created by Amr on 02/02/2023.
//

import Foundation

protocol HomeGateway {
    func getNewEpisodes() async -> Result<NewEpisodesModel,Error>
    func getChannel() async -> Result<ChannelModel,Error>
    func getCategories() async -> Result<CategoryModel,Error>
}

class AppHomeGateway: HomeGateway{
    func getChannel() async -> Result<ChannelModel, Error> {
        let urlRequest = URLRequest(url: URL(string: "https://pastebin.com/raw/Xt12uVhM")!)
        let res: Result<ChannelModel, any Error> = await apiManager.request(urlRequest)
        switch res{
        case .success(let data):
            print(data)
            break
        case .failure(let error):
            print(error)
        }
        return res
    }
    
    func getCategories() async -> Result<CategoryModel, Error> {
        let urlRequest = URLRequest(url: URL(string: "https://pastebin.com/raw/A0CgArX3")!)
        let res: Result<CategoryModel, any Error> = await apiManager.request(urlRequest)
        switch res{
        case .success(let data):
            print(data)
            break
        case .failure(let error):
            print(error)
        }
        return res
    }
    
    
    let apiManager = AppAPIManager()
    
    func getNewEpisodes() async -> Result<NewEpisodesModel, Error> {
        let urlRequest = URLRequest(url: URL(string: "https://pastebin.com/raw/z5AExTtw")!)
        let res: Result<NewEpisodesModel, any Error> = await apiManager.request(urlRequest)
        switch res{
        case .success(let data):
            print(data)
            break
        case .failure(let error):
            print(error)
        }
        return res
    }
    
    
}
