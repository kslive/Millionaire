//
//  QuestionsCell.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

class QuestionsCell: UITableViewCell {
    @IBOutlet weak var questionsTitle: UILabel!
    
    func setup(for text: String) {
        setup()
        
        questionsTitle.text = text
    }
}

extension QuestionsCell {
    private func setup() {
        selectionStyle = .none
        
        questionsTitle.numberOfLines = 0
    }
}
