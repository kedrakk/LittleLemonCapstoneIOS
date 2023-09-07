//
//  HomeView.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 8/30/23.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationView{
            MenuView()
                   .navigationBarTitleDisplayMode(.inline)
                   .padding(EdgeInsets(top: 10, leading: 0, bottom: 15, trailing: 0))
                   .background(Color.secondaryWhite)
                   .toolbar {
                       ToolbarItem(placement: .principal) {
                           Image("Logo")
                       }
                       ToolbarItem(placement: .navigationBarTrailing) {
                           NavigationLink {
                               UserProfile()
                           } label: {
                               Image("Profile").resizable().frame(width: 50,height: 50)
                           }

                       }
                   }
                   
        }.navigationBarBackButtonHidden(true)
            
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
