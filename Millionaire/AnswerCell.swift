//
//  AnswerCell.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

class AnswerCell: UITableViewCell {

    @IBOutlet weak var answerButton: UIButton!
    
    var onButtonTouch: (() -> Void)?
    
    func setup(for text: String, onButtonTouch: (() -> Void)?) {
        setup()
        
        answerButton.setTitle(text, for: .normal)
        self.onButtonTouch = onButtonTouch
    }
}

extension AnswerCell {
    private func setup() {
        selectionStyle = .none
        
        setupButton()
    }
    
    private func setupButton() {
        answerButton.addTarget(self, action: #selector(touchedAnswerButton), for: .touchUpInside)
    }
}

extension AnswerCell {
    @objc
    private func touchedAnswerButton() {
        onButtonTouch?()
    }
}
