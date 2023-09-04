//
//  LittleLemonCapstoneIOSApp.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 8/25/23.
//

import SwiftUI

@main
struct LittleLemonCapstoneIOSApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            OnboardingView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
