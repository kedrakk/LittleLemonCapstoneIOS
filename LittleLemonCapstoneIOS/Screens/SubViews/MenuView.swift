//
//  MenuView.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 8/30/23.
//

import SwiftUI

struct MenuView: View {
    @State var searchText:String = ""
    
    var body: some View {
        VStack{
            AppHeroView(bottomView: AppTextView(label: "Search menu", value: $searchText,iconName: "magnifyingglass"))
            MenuCategoryListView()
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()){ (dishes:[Dish]) in
                List {
                    ForEach(dishes, id: \.self) { dish in
                        
                        MenuItemView(dish: dish)

                    }
                }
                .listStyle(PlainListStyle())
            }
        }
    }
    
    func buildSortDescriptors()->[NSSortDescriptor]{
        return [
            NSSortDescriptor(key: "title",
                                            ascending: true,
                                            selector:
                                               #selector(NSString .localizedCaseInsensitiveCompare)),
        ]
    }
    
    func buildPredicate() -> NSPredicate {
        if(searchText == ""){
            return NSPredicate(format: "TRUEPREDICATE")
        }
        return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
}



struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
