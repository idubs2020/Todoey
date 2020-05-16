//
//  Item.swift
//  Todoey
//
//  Created by Boedy on 2020/05/16.
//  Copyright © 2020 Boedy. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
