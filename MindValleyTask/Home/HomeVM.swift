//
//  HomeVM.swift
//  MindValleyTask
//
//  Created by Amr on 02/02/2023.
//

import Foundation
import SwiftUI


class HomeVM: ObservableObject{
    
    private let homeDataSource: HomeDataSourceProtocol
    @Published private(set) var newEpisodes: [Media] = [Media]()
    @Published private(set) var channels: [Channel] = [Channel]()
    @Published private(set) var categories: [Category] = [Category]()
    
    init(homeDataSource: HomeDataSourceProtocol = HomeDataSource()) {
        self.homeDataSource = homeDataSource
        Task{
            await getNewEpisodes()
            await getChannels()
            await getCategories()
        }
    }
    func getNewEpisodes() async{
        
        newEpisodes = await homeDataSource.getNewEpisodes() ?? []
        
    }
    
    func getChannels() async{
        channels = await homeDataSource.getChannel() ?? []
        
    }
    
    func getCategories() async{
        categories = await homeDataSource.getCategories() ?? []
    }

    
}
