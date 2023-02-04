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
    @Published private(set) var newEpisodes: [Media]?
    @Published private(set) var channels: [Channel]?
    @Published private(set) var categories: [Category]?
    
    init(homeDataSource: HomeDataSourceProtocol = HomeDataSource()) {
        self.homeDataSource = homeDataSource
    }
    func getNewEpisodes() async{
        newEpisodes = await homeDataSource.getNewEpisodes()
        
    }
    
    func getChannels() async{
        channels = await homeDataSource.getChannel()
        
    }
    
    func getCategories() async{
        categories = await homeDataSource.getCategories()
    }

    
}
