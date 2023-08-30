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
    init(label: String, value: Binding<String>) {
        self.label = label
        self.value = value
    }
    var body: some View {
        TextField(label, text: value)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.secondary.opacity(0.5))
            )
            .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
    }
}

