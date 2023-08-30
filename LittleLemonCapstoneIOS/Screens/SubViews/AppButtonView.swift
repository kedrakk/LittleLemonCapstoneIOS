//
//  AppButtonView.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 8/30/23.
//

import SwiftUI

struct AppButtonView: View {
    let title:String
    let action:()->Void
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    var body: some View {
        Button(action: action) {
            Text(title)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.secondaryWhite)
                                .background(RoundedRectangle(cornerRadius: 5,style: .circular).foregroundColor(.primaryBlue))
                                .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
        }
    }
}
