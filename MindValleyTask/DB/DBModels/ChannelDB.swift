//
//  ChannelDB.swift
//  MindValleyTask
//
//  Created by Amr on 05/02/2023.
//

import Foundation
//import RealmSwift
//import SwiftUI

//class ChannelDB: Object{
//    @objc dynamic var title: String?
//     var series: [SeriesDB]
//    @objc dynamic var mediaCount: String?
//     var latestMedia: [LatestMediaDB]
//    @objc dynamic var id: String?
//     var iconAsset: IconAssetDB?
//    @objc dynamic var coverAsset: String?
//    @objc dynamic var slug: String?
//    
//    override init(){
//        series = [SeriesDB]()
//        latestMedia = [LatestMediaDB]()
//    }
//    
//    init(_ object: Channel) {
//        title = object.title
//        mediaCount = "\(object.mediaCount ?? 0)"
//        id = object.id
//        coverAsset = object.coverAsset?.url
//        slug = object.slug
//        iconAsset = IconAssetDB(object.iconAsset)
//        latestMedia = [LatestMediaDB]()
//        for item in object.latestMedia ?? [] {
//            latestMedia.append(LatestMediaDB(item))
//        }
//        series = [SeriesDB]()
//        for item in object.series ?? [] {
//            series.append(SeriesDB(item))
//        }
//    }
//    
//    func convertToChannel() -> Channel{
//        let channel = Channel()
//        channel.title = self.title
//        channel.mediaCount = Int(self.mediaCount ?? "0")
//        channel.id = self.id
//        channel.coverAsset?.url = self.coverAsset
//        channel.slug = self.slug
//        channel.iconAsset = self.iconAsset?.convertToIconAsset()
//        channel.latestMedia = [LatestMedia]()
//        for item in self.latestMedia ?? [] {
//            channel.latestMedia?.append(item.convertToLatestMedia())
//        }
//        channel.series = [Series]()
//        for item in self.series ?? [] {
//            channel.series?.append(item.convertToSeries())
//        }
//        return channel
//    }
//    
//}
//
//class IconAssetDB: Object {
//    @objc dynamic var thumbnailURL: String?
//    @objc dynamic var url: String?
//    
//    
//    override init(){
//        
//    }
//    
//    init(_ object: IconAsset?){
//        thumbnailURL = object?.thumbnailURL
//        url = object?.url
//    }
//    
//    func convertToIconAsset() -> IconAsset{
//        var icon = IconAsset()
//        icon.url = self.url
//        icon.thumbnailURL = self.thumbnailURL
//        return icon
//    }
//}
//
//class LatestMediaDB: Object {
//    @objc dynamic var title: String?
//    @objc dynamic var type: String?
//    @objc dynamic var coverAsset: String?
//    
//    override init(){
//        
//    }
//    
//    init(_ object: LatestMedia){
//        title = object.title
//        type = object.type?.rawValue
//        coverAsset = object.coverAsset?.url
//    }
//    
//    func convertToLatestMedia() -> LatestMedia{
//        var media = LatestMedia()
//        media.title = self.title
//        media.type = TypeEnum(rawValue: self.type ?? "")
//        media.coverAsset?.url = self.coverAsset
//        return media
//    }
//}
//
//class SeriesDB: Object {
//    @objc dynamic var title: String?
//    @objc dynamic var coverAsset: String?
//    @objc dynamic var id: String?
//    
//    override init(){
//        
//    }
//    
//    init(_ object: Series){
//        title = object.title
//        coverAsset = object.coverAsset?.url
//        id = object.id
//    }
//    
//    func convertToSeries() -> Series{
//        var series = Series()
//        series.title = self.title
//        series.coverAsset?.url = self.coverAsset
//        series.id = self.id
//        
//        return series
//    }
//    
//    
//}
