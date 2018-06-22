//
//  CoreDataStack.swift
//  PairRandomizer
//
//  Created by Caston  Boyd on 6/22/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import Foundation
import CoreData



struct CoreDataStack {
    
    // Declare a variable for our Persistent Container
    static let container: NSPersistentContainer = {
        
        // Grab the app name
        let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
        // Create the actual container object
        let container = NSPersistentContainer(name: appName)
        // Load data from persistent store
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    // Creating a reference to our Managed Object Context (MOC) so that we can access it elsewhere in the project
    static var managedObjectContext: NSManagedObjectContext { return container.viewContext }
}

