//
//  EpisodesDM.swift
//  MindValleyTask
//
//  Created by Amr on 05/02/2023.
//

import Foundation

//@objc(EpisodesDM)
//class EpisodesDM: NSManagedObject {
//
//    static func create(dbManager: DataBaseManager,
//                       type: String,
//                       title: String,
//                       coverAsset: String?,
//                       channel: String?) -> LogsEntity {
//        guard let dbManager = dbManager as? CoreDataStackManager else {
//            fatalError("dbManager must be a CoreDataStackManager")
//        }
//        var entity: LogsEntity!
//        dbManager.backgroundContext.performAndWait {
//            entity = EpisodesDM(entity: EpisodesDM.entity(),
//                                insertInto: dbManager.backgroundContext)
//            entity.type = type
//            entity.title = title
//            entity.coverAsset = coverAsset
//            entity.channel = channel
//        }
//        return entity
//    }
//}
//
//extension EpisodesDM {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<LogsEntity> {
//        return NSFetchRequest<LogsEntity>(entityName: "LogsEntity")
//    }
//
//    @NSManaged public var type: String?
//    @NSManaged public var title: String?
//    @NSManaged public var coverAsset: String?
//    @NSManaged public var channel: String?
//}
//
//extension LogsEntity : Identifiable {
//
//}
