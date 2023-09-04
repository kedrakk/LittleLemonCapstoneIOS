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
                        Spacer()
                        //https://talksport.com/wp-content/uploads/sites/5/2020/09/image-a4262f158a.jpg?w=620
                        //"\(dishItem.image ?? "")"
                        AsyncImage(
                            url:URL(string: "\(String(describing: dishItem.image))"),
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
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
