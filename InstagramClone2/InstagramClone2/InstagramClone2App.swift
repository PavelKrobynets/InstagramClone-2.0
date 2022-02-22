//
//  InstagramClone2App.swift
//  InstagramClone2
//
//  Created by mac on 14.12.2021.
//

import SwiftUI
import Firebase

@main
struct InstagramClone2App: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
           ContentView()
        }
    }
}
