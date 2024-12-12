//
//  RecipeWorldApp.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import SwiftUI

@main
struct RecipeWorldApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
