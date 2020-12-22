//
//  SimpleRunningApp.swift
//  SimpleRunning
//
//  Created by Tyler Linquata on 12/21/20.
//

import SwiftUI

@main
struct SimpleRunningApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
