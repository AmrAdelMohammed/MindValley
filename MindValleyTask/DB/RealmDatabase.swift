//
//  CategoriesDB.swift
//  MindValleyTask
//
//  Created by Amr on 03/02/2023.
//

import Foundation
import RealmSwift


protocol Database {
    func saveData<T:Object>(_ objects: [T])
    func getData<T:Object>() -> [T]?
    func deleteAllFromObject<T: Object>(_ object: T.Type)
}


class RealmDatabase: Database {
    
    static var shared: Database = RealmDatabase()
    
    var realm: Realm!
    
    
    private init() {
        self.realm = try! Realm()
    }
    
    func saveData<T:Object>(_ objects: [T]) {
        try! realm.write {
            realm.add(objects)
        }
    }
    
    func getData<T:Object>() -> [T]? {
        let objects = realm.objects((T.self)).toArray((T.self))
        
        return objects.count > 0 ? objects : nil
    }
    
    func deleteAllFromObject<T: Object>(_ object: T.Type) {
        let allUploadingObjects = realm.objects(T.self)

        try! realm.write {
            realm.delete(allUploadingObjects)
        }
    }
    
}

extension Results {
    func toArray<T>(_ type: T.Type) -> [T] {
        return compactMap { $0 as? T }
    }
}
