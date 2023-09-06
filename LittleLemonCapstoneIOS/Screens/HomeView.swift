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
        TabView {
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            UserProfile()
                .tabItem {
                    Label("Profile",systemImage: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden(true)
//            .onAppear(){
//                Menu().getMenuData(viewContext)
//            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView ()
    }
}
