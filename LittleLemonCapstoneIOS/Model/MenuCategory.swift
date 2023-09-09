//
//  MenuCategory.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 9/9/23.
//

import Foundation

struct MenuCategory:Identifiable {
    let id: UUID
    var selected:Bool
    let title:String
    
    init(selected: Bool, title: String) {
        self.id = UUID()
        self.selected = selected
        self.title = title
    }
}

var allMenuCategoryList = [
    MenuCategory(selected: false, title: "Starters"),
    MenuCategory(selected: false, title: "Mains"),
    MenuCategory(selected: false, title: "Desserts"),
    MenuCategory(selected: false, title: "Drinks")
]

