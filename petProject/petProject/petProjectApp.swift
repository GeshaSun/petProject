//
//  petProjectApp.swift
//  petProject
//
//  Created by Михаил Евсеев on 24.04.2023.
//

import SwiftUI

@main
struct petProjectApp: App {
    @StateObject private var dataController = DataConroller()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext )
        }
    }
}
