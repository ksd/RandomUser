//
//  RandomUserApp.swift
//  RandomUser
//
//  Created by ksd on 24/02/2022.
//

import SwiftUI

@main
struct RandomUserApp: App {
    @StateObject var randomUserViewModel = RandomUserViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(randomUserViewModel: randomUserViewModel)
        }
    }
}
