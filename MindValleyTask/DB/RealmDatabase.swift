////
////  CategoriesDB.swift
////  MindValleyTask
////
////  Created by Amr on 03/02/2023.
////
//
//import Foundation
//import RealmSwift
//
//
//protocol Database {
//    func saveData<T:Object>(_ objects: [T])
////    func getData<T:Object>() -> [T]?
////    func deleteAllFromObject<T: Object>(_ object: T.Type)
//    func getData<T:Object>() -> [T]?
//    func deleteAllFromObject<T: Object>(_ object: T.Type)
//}
//
//
//class RealmDatabase: Database {
//    
//    static var shared: Database = RealmDatabase()
//    
//    var realm: Realm!
//    
//    let dispatchQueue = DispatchQueue(label: "com.Amr.MindValley")
//    
//    private init() {
//        dispatchQueue.sync {
//            self.realm = try! Realm()
//        }
//        
//    }
//    
//    func saveData<T:Object>(_ objects: [T]) {
//        try! realm.write {
//            realm.add(objects)
//        }
//    }
//    
//    func getData<T:Object>() -> [T]? {
//        let objects = realm.objects((T.self)).toArray((T.self))
//        
//        return objects.count > 0 ? objects : nil
//    }
//    
//    func deleteAllFromObject<T: Object>(_ object: T.Type) {
//        let personRef = ThreadSafeReference(to: object)
//        dispatchQueue.async {
//            let allUploadingObjects = self.realm.objects(T.self)
//
//            try! self.realm.write {
//                self.realm.delete(allUploadingObjects)
//            }
//        }
//        
//    }
//    
//}
//
//extension Results {
//    func toArray<T>(_ type: T.Type) -> [T] {
//        return compactMap { $0 as? T }
//    }
//}
//
