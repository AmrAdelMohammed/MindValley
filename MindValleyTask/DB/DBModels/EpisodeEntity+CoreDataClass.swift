//
//  EpisodeEntity+CoreDataClass.swift
//  MindValleyTask
//
//  Created by Amr on 05/02/2023.
//

import CoreData

@objc(EpisodeEntity)
class EpisodeEntity: NSManagedObject {

    static func create(dbManager: DataBaseManager,
                       type: String,
                       title: String,
                       coverAsset: String?,
                       channel: String?) -> EpisodeEntity {
        guard let dbManager = dbManager as? CoreDataStackManager else {
            fatalError("dbManager must be a CoreDataStackManager")
        }
        var entity: EpisodeEntity!
        dbManager.backgroundContext.performAndWait {
            entity = EpisodeEntity(entity: EpisodeEntity.entity(),
                                   insertInto: dbManager.backgroundContext)
            entity.type = type
            entity.title = title
            entity.coverAsset = coverAsset
            entity.channel = channel
        }
        return entity
    }
}
