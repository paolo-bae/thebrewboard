//
//  TheBrewBoardApp.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 19/01/23.
//

import SwiftUI

@main
struct TheBrewBoardApp: App {
   // let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
