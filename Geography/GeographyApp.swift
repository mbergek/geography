//
//  GeographyApp.swift
//  Geography
//
//  Created by Martin on 2021-06-27.
//

import SwiftUI

@main
struct GeographyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
