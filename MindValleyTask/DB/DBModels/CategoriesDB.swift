//
//  CategoriesDB.swift
//  MindValleyTask
//
//  Created by Amr on 05/02/2023.
//

import Foundation
import RealmSwift

class CategoriesDB: Object{
    @objc dynamic var name: String?
    
    override init() {}
    
    init(_ object: Category){
        name = object.name
    }
    
    func convertToCategory() -> Category{
        let cat = Category()
        cat.name = self.name
        return cat
    }
}
