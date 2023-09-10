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
    let isPrimary: Bool
    init(title: String, action: @escaping () -> Void, isPrimary:Bool = true) {
        self.title = title
        self.action = action
        self.isPrimary = isPrimary
    }
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(isPrimary ? .secondaryWhite : Color.secondaryBlack)
                .background(RoundedRectangle(cornerRadius: 5,style: .circular)
                    .foregroundColor(isPrimary ? .primaryBlue : Color.primaryYellow))
                .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
        }
    }
}
