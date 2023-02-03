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
struct Media: Codable {
    var type, title: String?
    var coverAsset: CoverAsset?
    var channel: NewEpisodesChannel?
}

// MARK: - Channel
struct NewEpisodesChannel: Codable {
    var title: String?
}

// MARK: - CoverAsset
struct CoverAsset: Codable {
    var url: String?
}
