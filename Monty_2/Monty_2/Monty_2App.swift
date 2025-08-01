//
//  Monty_2App.swift
//  Monty_2
//
//  Created by Guruansh  Kohli  on 8/1/25.
//MontyApp

import SwiftUI

@main
struct Monty_2App: App {
    @StateObject private var monty = Monty()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(monty)
        }
    }
}

