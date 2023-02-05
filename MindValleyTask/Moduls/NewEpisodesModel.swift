//
//  NewEpisodesModel.swift
//  MindValleyTask
//
//  Created by Amr on 29/01/2023.
//

import Foundation

// MARK: - Welcome
struct NewEpisodesModel: Codable {
    var data: NewEpisodesModelData?
}

// MARK: - DataClass
struct NewEpisodesModelData: Codable {
    var media: [Media]?
}

// MARK: - Media
class Media: Codable, Identifiable {

    @objc dynamic var type, title: String?
    var coverAsset: CoverAsset?
    var channel: NewEpisodesChannel?
    
    init(type: String?,
         title: String?,
         coverAsset: String?,
         channel: String?) {
        self.type = type
        self.title = title
        self.coverAsset = CoverAsset(url: coverAsset)
        self.channel = NewEpisodesChannel(title: channel)
    }
}

// MARK: - Channel
struct NewEpisodesChannel: Codable {
    var title: String?
}

// MARK: - CoverAsset
struct CoverAsset: Codable {
    var url: String?
}
