//
//  EpisodeEntity+CoreDataProperties.swift
//  MindValleyTask
//
//  Created by Youssef on 05/02/2023.
//

import CoreData

extension EpisodeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EpisodeEntity> {
        return NSFetchRequest<EpisodeEntity>(entityName: "EpisodeEntity")
    }

    @NSManaged public var type: String?
    @NSManaged public var title: String?
    @NSManaged public var coverAsset: String?
    @NSManaged public var channel: String?
}

extension EpisodeEntity : Identifiable {

}
