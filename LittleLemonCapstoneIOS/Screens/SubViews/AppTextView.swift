//
//  AppTextView.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 8/30/23.
//

import SwiftUI

struct AppTextView: View {
    let label:String
    let value:Binding<String>
    var iconName:String
    init(label: String, value: Binding<String>,iconName:String = "") {
        self.label = label
        self.value = value
        self.iconName = iconName
    }
    var body: some View {
        HStack{
            if(!iconName.isEmpty){
                Image(systemName: iconName)
            }
            TextField(label, text: value)
        }
            .padding()
            .background(Color.secondaryWhite)
            .cornerRadius(6)
            .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
    }
}

