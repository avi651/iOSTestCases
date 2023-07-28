//
//  LoginAPIApp.swift
//  LoginAPI
//
//  Created by Avinash Kumar on 28/07/23.
//

import SwiftUI

@main
struct LoginAPIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
