//
//  CategoriesDB.swift
//  MindValleyTask
//
//  Created by Amr on 03/02/2023.
//

import Foundation
import RealmSwift


struct RealmDatabase {
    
    static var shared = RealmDatabase()
    
    var realm: Realm!
    
    
    init() {
        self.realm = try! Realm()
    }
    
    func saveCategories(_ categories: Category) {
        try! realm.write {
            realm.add(categories)
        }
    }
    
}
