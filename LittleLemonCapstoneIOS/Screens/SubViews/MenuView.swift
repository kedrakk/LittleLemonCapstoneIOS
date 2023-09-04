//
//  MenuView.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 8/30/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        FetchedObjects(){ (dishes:[Dish]) in
            List {
                ForEach(dishes) { dishItem in
                    HStack{
                        Text("\(dishItem.title ?? "") with \(dishItem.price ?? "") $")
                        AsyncImage(url: URL(string: "\(dishItem.image ?? "")"))
                            .frame(width: 200, height: 200)

                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
