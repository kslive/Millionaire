//
//  ResultsDataSource.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

class ResultsDataSource: NSObject, UITableViewDataSource {
    private weak var controller: UIViewController?
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        GameSession.shared.resultsOutput.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupResultsCell(for: tableView, in: indexPath)
    }
}

extension ResultsDataSource {
    private func setupResultsCell(for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ResultsCell.self), for: indexPath) as? ResultsCell else { return UITableViewCell() }
        
        let result = GameSession.shared.resultsOutput[indexPath.row]
        cell.setup(for: "\(result.countTrue)")
        return cell
    }
}
