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
        ZStack{
            HStack{
                VStack(alignment: .leading){
                    Text("\(dish.title ?? "")")
                        .font(.karlaLeadText)
                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                    Text("\(dish.desc ?? "")")
                        .lineLimit(2)
                        .fontWeight(.light)
                        .font(.karlaParagraph)
                        .foregroundColor(.primaryBlue)
                    Text("$ \(dish.price ?? "")")
                        .fontWeight(.heavy)
                        .font(.karlaLeadText)
                        .foregroundColor(.primaryBlue)
                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                }
                Spacer()
                AsyncImage(
                    url:URL(string: "\(dish.image ?? "")"),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 100)
                    },
                    placeholder: {
                        Rectangle().frame(width:  100, height: 70).foregroundColor(.secondaryBlack)
                    }
                )
            }
            NavigationLink(destination: ItemDetailView(dish: dish)) {
                
            }.buttonStyle(PlainButtonStyle())
        }
//        NavigationLink(destination: ItemDetailView(dish: dish)) {
//            HStack{
//                VStack(alignment: .leading){
//                    Text("\(dish.title ?? "")")
//                        .font(.karlaLeadText)
//                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
//                    Text("\(dish.desc ?? "")")
//                        .lineLimit(2)
//                        .fontWeight(.light)
//                        .font(.karlaParagraph)
//                        .foregroundColor(.primaryBlue)
//                    Text("$ \(dish.price ?? "")")
//                        .fontWeight(.heavy)
//                        .font(.karlaLeadText)
//                        .foregroundColor(.primaryBlue)
//                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
//                }
//                Spacer()
//                AsyncImage(
//                    url:URL(string: "\(dish.image ?? "")"),
//                    content: { image in
//                        image.resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(maxWidth: 100, maxHeight: 100)
//                    },
//                    placeholder: {
//                        Rectangle().frame(width:  100, height: 70).foregroundColor(.secondaryBlack)
//                    }
//                )
//            }
//        }.buttonStyle(PlainButtonStyle())
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
