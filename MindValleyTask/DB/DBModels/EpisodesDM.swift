//
//  EpisodesDM.swift
//  MindValleyTask
//
//  Created by Amr on 05/02/2023.
//

import Foundation
import RealmSwift

class EpisodesDM:Object, ThreadConfined{
    @objc dynamic var type, title: String?
    @objc dynamic var coverAsset: String?
    @objc dynamic var channel: String?
    
    
//    init(media: Media) {
//        type = media.type
//        title = media.title
//        coverAsset = media.coverAsset?.url  ?? ""
//        channel = media.channel?.title ?? ""
//    }
//    
//    func convertToMedia() -> Media{
//        let media = Media()
//        media.title = self.title
//        media.type = self.type
//        media.coverAsset?.url = self.coverAsset
//        media.channel?.title = self.channel
//        return media
//    }
}

