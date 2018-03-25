//
//  ExercisesViewController+UserDefaults.swift
//  GTracker
//
//  Created by 3axap on 25.03.18.
//  Copyright © 2018 3axap. All rights reserved.
//

import Foundation

extension ExercisesViewController {
    
    func loadExercises() {
        if let decodedData = UserDefaults.standard.object(forKey: "Exercises") as? Data,
            let decodedExercises = NSKeyedUnarchiver.unarchiveObject(with: decodedData) as? [Exercise] {
            exercises = decodedExercises
        } else {
            //TODO: Remove afer checking
            showAlert(title: "Failed to load data from UserDefaults")
        }
    }
    
    func saveExercises() {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: exercises)
        UserDefaults.standard.set(encodedData, forKey: "Exercises")
        UserDefaults.standard.synchronize()
    }
}
