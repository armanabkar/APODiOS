//
//  APODiOSApp.swift
//  APODiOS
//
//  Created by Arman Abkar on 2/26/22.
//

import SwiftUI

@main
struct APODiOSApp: App {
    
    @StateObject private var model: ContentViewModel
    
    init() {
        self._model = StateObject(wrappedValue: ContentViewModel())
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
