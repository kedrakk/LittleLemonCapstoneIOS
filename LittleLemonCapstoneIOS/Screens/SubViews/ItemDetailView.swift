//
//  ItemDetailView.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 9/4/23.
//

import SwiftUI

struct ItemDetailView: View {
    let dish: Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
    
    var body: some View {
        Text("\(dish.title ?? "Null Title")")
    }
}

