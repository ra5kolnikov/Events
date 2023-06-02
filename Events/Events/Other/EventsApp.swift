//
//  EventsApp.swift
//  Events
//
//  Created by Виталий on 02.06.2023.
//

import SwiftUI
import FirebaseCore

@main
struct EventsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
