//
//  CategoryModel.swift
//  MindValleyTask
//
//  Created by Amr on 29/01/2023.
//

import Foundation
import RealmSwift

struct CategoryModel: Codable {
    var data: CategoryData?
}

// MARK: - DataClass
struct CategoryData: Codable {
    var categories: [Category]?
}

// MARK: - Category
class Category: Object, Codable {
    var name: String?
    
//    override static func primaryKey() -> String? {
//        return "name"
//    }
}
