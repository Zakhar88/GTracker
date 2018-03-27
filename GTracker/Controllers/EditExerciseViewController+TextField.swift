//
//  EditExerciseViewController+TextField.swift
//  GTracker
//
//  Created by Zakhar Garan on 27.03.18.
//  Copyright © 2018 3axap. All rights reserved.
//

import UIKit

extension EditExerciseViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == repsField && isPickerViewActive { return false }
        if textField == nameField { return true }
        var charactersSet = CharacterSet.decimalDigits
        if textField == weightField {
            charactersSet = charactersSet.union(CharacterSet(charactersIn: ".,"))
        }
        return charactersSet.isSuperset(of: CharacterSet(charactersIn: string))
    }
}
