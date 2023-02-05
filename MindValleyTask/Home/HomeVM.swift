//
//  HomeVM.swift
//  MindValleyTask
//
//  Created by Amr on 02/02/2023.
//

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
    
    private func getNewEpisodes() async {
        let newEpisodes = await homeDataSource.getNewEpisodes() ?? []
        DispatchQueue.main.async {
            self.newEpisodes = newEpisodes
        }
    }

    private func getChannels() async{
        let channels = await homeDataSource.getChannel() ?? []
        DispatchQueue.main.async {
            self.channels = channels
        }
    }

    private func getCategories() async{
        let categories = await homeDataSource.getCategories() ?? []
        DispatchQueue.main.async {
            self.categories = categories
        }
    }
}
