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
    
    var exercises = [Exercise]() {
        didSet {
            exercisesTableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        loadExercises()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditSegue", let editVC = segue.destination as? EditExerciseViewController{
            editVC.saveClosure = { exercise in
                self.exercises.append(exercise)
                self.exercisesTableView?.reloadData()
                self.saveExercises()
            }
        }
    }
}
