//
//  CategoryEntity+CoreDataClass.swift
//  MindValleyTask
//
//  Created by Amr on 05/02/2023.
//

import CoreData

@objc(CategoryEntity)
class CategoryEntity: NSManagedObject {

    static func create(dbManager: DataBaseManager,
                       name: String)-> CategoryEntity {
        guard let dbManager = dbManager as? CoreDataStackManager else {
            fatalError("dbManager must be a CoreDataStackManager")
        }
        var entity: CategoryEntity!
        dbManager.backgroundContext.performAndWait {
            entity = CategoryEntity(entity: CategoryEntity.entity(),
                                   insertInto: dbManager.backgroundContext)
            entity.name = name
        }
        return entity
    }
}
