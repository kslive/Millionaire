//
//  ResultsDataSource.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

class ResultsDataSource: NSObject, UITableViewDataSource {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ResultsCell.self), for: indexPath) as? ResultsCell else { return UITableViewCell() }
        
        cell.setup(for: "70")
        return cell
    }
}
