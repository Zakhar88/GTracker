//
//  ExercisesViewController.swift
//  GTracker
//
//  Created by 3axap on 25.03.18.
//  Copyright © 2018 3axap. All rights reserved.
//

import UIKit

class ExercisesViewController: UIViewController {
    
    @IBOutlet weak var exercisesTableView: UITableView?
    
    var exercises = [Exercise]()
    
    override func viewDidLoad() {
        loadExercises()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        exercises.sort(by: { $0.date < $1.date })
        exercisesTableView?.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditSegue", let editVC = segue.destination as? EditExerciseViewController{

            if let exercise = sender as? Exercise {
                editVC.exercise = exercise
                editVC.saveClosure = { changedExercise in
                    if let changedExerciseIndex = self.exercises.index(where: {$0.id == changedExercise.id}) {
                        self.exercises[changedExerciseIndex] = changedExercise
                    }
                    self.saveExercises()
                }
            } else {
                editVC.saveClosure = { exercise in
                    self.exercises.append(exercise)
                    self.saveExercises()
                }
            }
        }
    }
}
