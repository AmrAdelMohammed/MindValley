//
//  ChannelsEntity+CoreDataClass.swift
//  MindValleyTask
//
//  Created by Amr on 05/02/2023.
//

import CoreData

@objc(ChannelsEntity)
class ChannelsEntity: NSManagedObject {

    static func create(dbManager: DataBaseManager,
                       title: String?,
                       mediaCount: String?,
                       coverAsset: String?,
                       id: String?,
                       slug: String?,
                       series: NSData,
                       latestMedia: NSData,
                       thumbnailURLIcon: String?,
                       urlIcon: String?)-> ChannelsEntity {
        guard let dbManager = dbManager as? CoreDataStackManager else {
            fatalError("dbManager must be a CoreDataStackManager")
        }
        var entity: ChannelsEntity!
        dbManager.backgroundContext.performAndWait {
            entity = ChannelsEntity(entity: ChannelsEntity.entity(),
                                   insertInto: dbManager.backgroundContext)
            
        }
        return entity
    }
}
