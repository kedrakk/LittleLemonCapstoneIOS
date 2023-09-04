//
//  MenuItem.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 9/2/23.
//

import Foundation


struct MenuItem: Codable, Hashable, Identifiable {
    let id : Int
    let title: String
    let description: String
    let price: String
    let image: String
    let category:String
} 
