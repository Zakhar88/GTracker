//
//  EditExerciseViewController+PickerView.swift
//  GTracker
//
//  Created by Zakhar Garan on 27.03.18.
//  Copyright © 2018 3axap. All rights reserved.
//

import UIKit

extension EditExerciseViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)" + (component == 0 ? " хв" : " сек")
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let minutes = pickerView.selectedRow(inComponent: 0)
        let seconds = pickerView.selectedRow(inComponent: 1)
        
        var repsStrings = [String]()

        
        if minutes != 0 {
            repsStrings.append("\(minutes) хв")
        }
        
        if seconds != 0 {
            repsStrings.append("\(seconds) сек")
        }

        repsField.text = repsStrings.joined(separator: " ")
    }
}
