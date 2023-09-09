//
//  MenuCategoryListView.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 9/9/23.
//

import SwiftUI

struct MenuCategoryListView: View {
    
    var body: some View {
        VStack(alignment: .leading){
            Text("ORDER FOR DELIVERY!").bold()
            ScrollView(.horizontal) {
                HStack{
                    ForEach(allMenuCategoryList) { category in
                        Text("\(category.title)")
                            .bold()
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .background(category.selected ? Color.primaryBlue : Color.secondaryWhite)
                            .cornerRadius(30)
                            .foregroundColor(category.selected ? Color.secondaryWhite : Color.primaryBlue)
//                            .onTapGesture {
//                                var tempCategory = allMenuCategoryList.first { menucategory in
//                                    menucategory.id == category.id
//                                }
//                                tempCategory?.selected = !category.selected
//                            }
                    }
                }
            }.padding(.vertical,10)
            Divider()
        }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
    }
}

struct MenuCategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCategoryListView()
    }
}
