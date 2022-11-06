//
//  autistic_thingsApp.swift
//  autistic things
//
//  Created by Bruno Sabadini on 28/06/22.
//

import SwiftUI

@main
struct autistic_thingsApp: App {
  @StateObject private var dataController = DataController()
  
  var body: some Scene {
    WindowGroup {
      ThreeLinesToBackArrow()
        .environment(\.managedObjectContext, dataController.container.viewContext)
    }
  }
}

