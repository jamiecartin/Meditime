//
//  MeditateTimeApp.swift
//  MeditateTime
//
//  Created by Jamie Cartin on 3/24/23.
//

import SwiftUI

@main
struct MeditateTimeApp: App {
    @StateObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
}
