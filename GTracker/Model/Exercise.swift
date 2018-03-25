//
//  Exercise.swift
//  GTracker
//
//  Created by 3axap on 25.03.18.
//  Copyright © 2018 3axap. All rights reserved.
//

import Foundation

class Exercise: NSObject, NSCoding {
    
    var name: String
    var weight: NSNumber?
    var sets: NSNumber?
    var reps: String?
    var date: Date
    
    init(name: String) {
        self.name = name
        self.date = Date()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: "name") as? String,
            let date = aDecoder.decodeObject(forKey: "date") as? Date else {
            return nil
        }
        self.init(name: name)
        self.date = date
        self.weight = aDecoder.decodeObject(forKey: "weight") as? NSNumber
        self.reps = aDecoder.decodeObject(forKey: "reps") as? String
        self.sets = aDecoder.decodeObject(forKey: "sets") as? NSNumber
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(weight, forKey: "weight")
        aCoder.encode(reps, forKey: "reps")
        aCoder.encode(sets, forKey: "sets")
        aCoder.encode(date, forKey: "date")
    }
}
