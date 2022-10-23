//
//  DataController.swift
//  autistic things
//
//  Created by Bruno Sabadini on 13/09/22.
//

import CoreData
import Foundation

class DataController: ObservableObject{
  let container = NSPersistentContainer(name: "CoreData")
  
  init(){
    container.loadPersistentStores { description, error in
      if let error = error {
        print("Core Data failed to load: \(error.localizedDescription)")
      }
      
    }
  }
}
