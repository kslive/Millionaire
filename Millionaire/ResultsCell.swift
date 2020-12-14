//
//  ResultsCell.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

class ResultsCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
    func setup(for text: String) {
        setupTitleLabel()
        setupResultsLabel(for: text)
    }
}

extension ResultsCell {
    private func setupTitleLabel() {
        titleLabel.text = UI.ResultsUI.resultsTitle
    }
    
    private func setupResultsLabel(for text: String) {
        resultsLabel.text = UI.ResultsUI.percent(in: text)
    }
}
