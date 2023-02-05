//
//  ChannelModel.swift
//  MindValleyTask
//
//  Created by Amr on 29/01/2023.
//

import Foundation

// MARK: - Welcome
struct ChannelModel: Codable {
    var data: ChannelData?
}

// MARK: - DataClass
struct ChannelData: Codable {
    var channels: [Channel]?
}

// MARK: - Channel
class Channel:  Codable, Identifiable {
    var title: String?
    var series: [Series]?
    var mediaCount: Int?
    var latestMedia: [LatestMedia]?
    var id: String?
    var iconAsset: IconAsset?
    var coverAsset: CoverAsset?
    var slug: String?
    
    init(title: String? = nil, series: [Series]? = nil, mediaCount: Int? = nil, latestMedia: [LatestMedia]? = nil, id: String? = nil, iconAsset: IconAsset? = nil, coverAsset: String? = nil, slug: String? = nil) {
        self.title = title
        self.series = series
        self.mediaCount = mediaCount
        self.latestMedia = latestMedia
        self.id = id
        self.iconAsset = iconAsset
        self.coverAsset = CoverAsset(url: coverAsset)
        self.slug = slug
    }
}

// MARK: - IconAsset
struct IconAsset: Codable {
    var thumbnailURL: String?
    var url: String?

    init(thumbnailURL: String? = nil, url: String? = nil) {
        self.thumbnailURL = thumbnailURL
        self.url = url
    }
    
    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case url
    }
}

// MARK: - LatestMedia
struct LatestMedia: Codable, Identifiable {
    var id: Int?
    var title: String?
    var type: TypeEnum?
    var coverAsset: CoverAsset?
}

enum TypeEnum: String, Codable {
    case course = "course"
    case video = "video"
}

// MARK: - Series
struct Series: Codable, Identifiable {
    var title: String?
    var coverAsset: CoverAsset?
    var id: String?
}
