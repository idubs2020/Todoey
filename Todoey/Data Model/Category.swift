//
//  Category.swift
//  Todoey
//
//  Created by Boedy on 2020/05/16.
//  Copyright © 2020 Boedy. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
