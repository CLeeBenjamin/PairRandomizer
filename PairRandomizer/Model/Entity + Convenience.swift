//
//  Entity + Convenience.swift
//  PairRandomizer
//
//  Created by Caston  Boyd on 6/22/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import Foundation
import CoreData


extension Entity {
    
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        
        self.init(context: context)
        self.name = name
        
    }
    
    
}
