//
//  ChannelsEntity+CoreDataProperties.swift
//  MindValleyTask
//
//  Created by Amr on 05/02/2023.
//

import CoreData

extension ChannelsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChannelsEntity> {
        return NSFetchRequest<ChannelsEntity>(entityName: "ChannelsEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var series: NSData
    @NSManaged public var mediaCount: String?
    @NSManaged public var latestMedia: NSData
    @NSManaged public var id: String?
    @NSManaged public var thumbnailURLIcon: String?
    @NSManaged public var urlIcon: String?
    @NSManaged public var coverAsset: String?
    @NSManaged public var slug: String?
}

extension ChannelsEntity : Identifiable {

}
