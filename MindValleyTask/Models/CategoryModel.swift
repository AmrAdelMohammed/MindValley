//
//  CategoryModel.swift
//  MindValleyTask
//
//  Created by Amr on 29/01/2023.
//

import Foundation

struct CategoryModel: Codable {
    var data: CategoryData?
}

// MARK: - DataClass
struct CategoryData: Codable {
    var categories: [Category]?
}

// MARK: - Category
class Category: Codable, Identifiable {
    @objc dynamic var name: String?
    
}
