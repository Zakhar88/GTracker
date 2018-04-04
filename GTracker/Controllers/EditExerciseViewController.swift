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
            view.layoutIfNeeded()
            
            nameField.text = exercise.name

            if let weight = exercise.weight {
                weightField.text = String(format: "%g", weight)

            }
            if let sets = exercise.sets {
                setsField.text = "\(sets)"
            }
            if let reps = exercise.reps {
                repsField.text = "\(reps)"
            }
            
            title = dateFormatter.string(from: exercise.date)
        }
    }
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let lang = Locale.preferredLanguages.first
        dateFormatter.locale = Locale(identifier: lang!)
        return dateFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        if let weightText = weightField?.text, !weightText.isEmpty,
            let weight = Double(weightText) {
            exercise.weight = weight
        }
        
        if let setsText = setsField?.text, !setsText.isEmpty,
            let sets = Int(setsText) {
            exercise.sets = sets
        }
        
        if let reps = repsField?.text, !reps.isEmpty {
            exercise.reps = reps
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
        repsField.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
