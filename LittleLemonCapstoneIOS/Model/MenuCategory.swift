//
//  MenuCategory.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 9/9/23.
//

import Foundation

class MenuCategory:Identifiable,ObservableObject {
    let id: UUID
    @Published var selected:Bool
    let title:String
    
    init(selected: Bool, title: String) {
        self.id = UUID()
        self.selected = selected
        self.title = title
    }
}

class MenuCategoryList:ObservableObject{
    @Published var allMenuCategoryList:[MenuCategory]
    
    init(allMenuCategoryList:[MenuCategory]) {
        self.allMenuCategoryList = allMenuCategoryList
    }
}

class MenuCategoryListRepo:ObservableObject{
    @Published var menuCategoryList:MenuCategoryList
    
    init() {
        menuCategoryList = MenuCategoryList(
            allMenuCategoryList:[
                            MenuCategory(selected: false, title: "Starters"),
                            MenuCategory(selected: false, title: "Mains"),
                            MenuCategory(selected: false, title: "Desserts"),
                            MenuCategory(selected: false, title: "Drinks")
                        ]
        )
    }
}

