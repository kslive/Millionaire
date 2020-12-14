//
//  PresentViewController.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

class PresentViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resultsButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension PresentViewController {
    
    private func setup() {
        setupTitle()
        setupStartButton()
        setupResultButton()
        setupHelpButton()
    }
    
    private func setupTitle() {
        titleLabel.text = UI.PresentUI.title
    }
    
    private func setupStartButton() {
        startButton.setTitle(UI.PresentUI.start, for: .normal)
    }
    
    private func setupResultButton() {
        resultsButton.setTitle(UI.PresentUI.result, for: .normal)
    }
    
    private func setupHelpButton() {
        helpButton.addTarget(self, action: #selector(touchedHelpButton), for: .touchUpInside)
    }
}

extension PresentViewController {
    @objc
    private func touchedHelpButton() {
        Message.shared.show(.info(message: MessageConstants.Info.message), sender: self)
    }
}
