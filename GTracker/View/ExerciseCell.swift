//
//  ExerciseCell.swift
//  GTracker
//
//  Created by 3axap on 25.03.18.
//  Copyright © 2018 3axap. All rights reserved.
//

import UIKit

class ExerciseCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var exercise: Exercise? {
        didSet {
            guard let exercise = exercise else { return }
            nameLabel.text = exercise.name
            if let weight = exercise.weight {
                weightLabel.text = NumberFormatter().string(from: weight)
            }
            
            if let reps = exercise.reps {
                infoLabel.text = reps
                if let sets = exercise.sets {
                    infoLabel.text = NumberFormatter().string(from: sets)! + " x " + infoLabel.text!
                }
            }
            
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        infoLabel.text = nil
        weightLabel.text = nil
    }
}
