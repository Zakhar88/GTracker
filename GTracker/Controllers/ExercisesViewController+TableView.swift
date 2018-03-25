//
//  ExercisesViewController+TableView.swift
//  GTracker
//
//  Created by 3axap on 25.03.18.
//  Copyright © 2018 3axap. All rights reserved.
//

import UIKit

extension ExercisesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell
        cell.exercise = exercises[indexPath.row]        
        return cell
    }
}
