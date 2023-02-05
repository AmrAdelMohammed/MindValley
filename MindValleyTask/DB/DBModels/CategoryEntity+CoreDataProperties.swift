//
//  CategoryEntity+CoreDataProperties.swift
//  MindValleyTask
//
//  Created by Amr on 05/02/2023.
//

import CoreData

extension CategoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryEntity> {
        return NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
    }

    @NSManaged public var name: String?
}

extension CategoryEntity : Identifiable {

}
