//
//  Dex5App.swift
//  Dex5
//
//  Created by Lori Rothermel on 1/20/25.
//

import SwiftUI

@main
struct Dex5App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
