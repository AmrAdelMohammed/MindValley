//
//  HomeVM.swift
//  MindValleyTask
//
//  Created by Amr on 02/02/2023.
//

import Foundation

class HomeVM{
    
    var newEpisodes: [Media]?
    var channels: [Channel]?
    var categories: [Category]?
    let homeGateway = AppHomeGateway()
    
    func getNewEpisodes() async{
        let result = await homeGateway.getNewEpisodes()
        switch result{
        case .success(let data):
            print(data)
            newEpisodes = data.data?.media
            break
        case .failure(let error):
            print(error)
        }
    }
    
    func getChannels() async{
        let result = await homeGateway.getChannel()
        switch result{
        case .success(let data):
            print(data)
            channels = data.data?.channels
            break
        case .failure(let error):
            print(error)
        }
    }
    
    func getCategories() async{
        let result = await homeGateway.getCategories()
        switch result{
        case .success(let data):
            print(data)
            categories = data.data?.categories
            break
        case .failure(let error):
            print(error)
        }
    }

    
}
