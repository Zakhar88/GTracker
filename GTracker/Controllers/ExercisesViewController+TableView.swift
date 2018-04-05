//
//  ExercisesViewController+TableView.swift
//  GTracker
//
//  Created by 3axap on 25.03.18.
//  Copyright © 2018 3axap. All rights reserved.
//

import UIKit

extension ExercisesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell
        cell.exercise = exercises[indexPath.row]        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditSegue", sender: exercises[indexPath.row])
        exercisesTableView?.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            exercises.remove(at: indexPath.row)
            exercisesTableView?.deleteRows(at: [indexPath], with: .fade)
            saveExercises()
        }
    }
}
