//
//  AppCheckBox.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 9/10/23.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")

                configuration.label
            }.foregroundColor(.primaryBlue)
        })
    }
}
