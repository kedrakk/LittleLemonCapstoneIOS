//
//  MenuCategoryListView.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 9/9/23.
//

import SwiftUI

struct MenuCategoryListView: View {
    
    @StateObject var allMenuCategoryList = MenuCategoryListRepo()
    
    var body: some View {
        VStack(alignment: .leading){
            Text("ORDER FOR DELIVERY!").bold()
            ScrollView(.horizontal) {
                HStack{
                    ForEach(allMenuCategoryList.menuCategoryList.allMenuCategoryList.indices,id: \.self) { index in
                        Button {
                            allMenuCategoryList.menuCategoryList.allMenuCategoryList[index].selected.toggle()
                        } label: {
                            MenuCategoryListItem().environmentObject(allMenuCategoryList.menuCategoryList.allMenuCategoryList[index])
                        }

                    }
                }
            }.padding(.vertical,10)
            Divider()
        }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
    }
}

struct MenuCategoryListItem:View {
    @EnvironmentObject var menuCategory:MenuCategory
    var body: some View{
        Text(menuCategory.title)
            .bold()
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(menuCategory.selected ? Color.primaryBlue : Color.secondaryWhite)
            .cornerRadius(30)
            .foregroundColor(menuCategory.selected ? Color.secondaryWhite : Color.primaryBlue)
    }
}

struct MenuCategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCategoryListView()
    }
}
