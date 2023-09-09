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
            HeroSection(value: $searchText)
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()){ (dishes:[Dish]) in
                List {
                    ForEach(dishes, id: \.self) { dish in
                        
                        MenuItemView(dish: dish)

                    }
                }
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

struct HeroSection:View {
    let value:Binding<String>
    
    init(value: Binding<String>) {
        self.value = value
    }
    
    var body: some View{
        AppHeroView(bottomView: AppTextView(label: "Search menu", value: value,iconName: "magnifyingglass"))
        
    }
}

struct MenuItemView:View{
    let dish:Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
    
    var body: some View{
        NavigationLink(destination: ItemDetailView(dish: dish)) {
            HStack{
                Text("\(dish.title ?? "") with \(dish.price ?? "") $")
                Spacer()
                //https://talksport.com/wp-content/uploads/sites/5/2020/09/image-a4262f158a.jpg?w=620
                //"\(dishItem.image ?? "")"
                AsyncImage(
                    url:URL(string: "\(dish.image ?? "")"),
                                content: { image in
                                    image.resizable()
                                         .aspectRatio(contentMode: .fit)
                                         .frame(maxWidth: 100, maxHeight: 100)
                                },
                                placeholder: {
                                    //ProgressView()
                                    Rectangle().frame(width:  100, height: 70).foregroundColor(.secondaryBlack)
                                }
                            )

            }
        }
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
