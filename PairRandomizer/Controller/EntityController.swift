//
//  EntityController.swift
//  PairRandomizer
//
//  Created by Caston  Boyd on 6/22/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import Foundation
import CoreData

class EntityController {
    
    
    static let sharedController = EntityController()
    
   
    var entities: [Entity]
    {
        
        let request: NSFetchRequest<Entity> = Entity.fetchRequest()
        
        do {
            return try  CoreDataStack.managedObjectContext.fetch(request)
        } catch {
            return []
        }
    }
    //MARK: - creates a nested entity from entities
    var groups: [[Entity]] {
        return groupArray(name: entities)
    }
    
    
    func add(name: String){
            _ = Entity(name: name)
           saveToPersistentStorage()
        }
    
    
func remove(entity: Entity) {
    let modelObjectC = CoreDataStack.managedObjectContext
    modelObjectC.delete(entity)
    
}
    
    func saveToPersistentStorage() {
        do {
            try CoreDataStack.managedObjectContext.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
    
    
    //MARK: - 
    func groupArray(name: [Entity]) -> [[Entity]]{
        
        
        let group = stride(from: 0, to: name.count, by: 2).map { Array(name[$0..<min($0 + 2, name.count)]) }
        
        return group
    }
}
