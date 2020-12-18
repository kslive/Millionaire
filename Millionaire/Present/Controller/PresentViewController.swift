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
    @IBOutlet weak var settingsButton: UIButton!
    
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
        setupSettingsButton()
    }
    
    private func setupTitle() {
        titleLabel.text = UI.PresentUI.title
    }
    
    private func setupStartButton() {
        startButton.setTitle(UI.PresentUI.start, for: .normal)
        startButton.addTarget(self, action: #selector(touchedStartButton), for: .touchUpInside)
    }
    
    private func setupResultButton() {
        resultsButton.setTitle(UI.PresentUI.result, for: .normal)
        resultsButton.addTarget(self, action: #selector(touchedResultsButton), for: .touchUpInside)
    }
    
    private func setupHelpButton() {
        helpButton.addTarget(self, action: #selector(touchedHelpButton), for: .touchUpInside)
    }
    
    private func setupSettingsButton() {
        settingsButton.addTarget(self, action: #selector(touchedSettingsButton), for: .touchUpInside)
    }
}

extension PresentViewController {
    @objc
    private func touchedHelpButton() {
        Message.shared.show(.info(message: MessageConstants.Info.message), sender: self)
    }
    
    @objc
    private func touchedStartButton() {
        ViewManager.shared.showQuestions(self)
    }
    
    @objc
    private func touchedResultsButton() {
        ViewManager.shared.showResults(self)
    }
    
    @objc
    private func touchedSettingsButton() {
        ViewManager.shared.showSettings(self)
    }
}
