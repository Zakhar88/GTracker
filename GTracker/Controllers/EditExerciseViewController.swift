//
//  EditExerciseVievController.swift
//  GTracker
//
//  Created by 3axap on 26.03.18.
//  Copyright © 2018 3axap. All rights reserved.
//

import UIKit

class EditExerciseViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var setsField: UITextField!
    @IBOutlet weak var repsField: UITextField!
    
    var pickerView = UIPickerView()
    var saveClosure: ((Exercise)->())?
    var isPickerViewActive: Bool = false
    
    var exercise = Exercise(name: "") {
        didSet {
            nameField.text = exercise.name

            if let weight = exercise.weight {
                weightField.text = "\(weight)"
            }
            if let sets = exercise.sets {
                setsField.text = "\(sets)"
            }
            if let reps = exercise.reps {
                repsField.text = "\(reps)"
            }
            
            title = "new"//DateFormatter().string(from: exercise.date)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        title = dateFormatter.string(from: exercise.date)
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        guard let name = nameField?.text, !name.isEmpty else {
            showAlert(title: "Введіть назву вправи!")
            return
        }
        exercise.name = name
        
        if let weight = weightField?.text, !weight.isEmpty,
            let weightNumber = NumberFormatter().number(from: weight) {
            exercise.weight = weightNumber
        }
        
        if let sets = setsField?.text, !sets.isEmpty,
            let setsNumber = NumberFormatter().number(from: sets) {
            exercise.sets = setsNumber
        }
        
        if let reps = repsField?.text, !reps.isEmpty,
            let repsNumber = NumberFormatter().number(from: reps) {
            exercise.reps = repsNumber.stringValue
        }
        exercise.date = Date()
        
        saveClosure?(exercise)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func repsTypeChanged(_ sender: UISegmentedControl) {
        repsField.text = nil
        if sender.selectedSegmentIndex == 0 {
            repsField.inputView = nil
            repsField.endEditing(true)
            isPickerViewActive = false
        } else {
            repsField.inputView = pickerView
            isPickerViewActive = true
        }
    }
}
