//
//  SettingsViewController.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 18.12.2020.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func getQuestions(for state: QuestionsState) -> NormalToRandomQuestions {
        switch state {
        case .normal: return NormalQuestions()
        case .random: return RandomQuestions()
        }
    }
    
    private func dismiss() {
        dismiss(animated: true)
    }
}

extension SettingsViewController {
    private func setup() {
        setupTitleLabel()
        setupChooseLabel()
        setupNormalButton()
        setupRandomButton()
    }
    
    private func setupTitleLabel() {
        titleLabel.text = UI.SettingsUI.title
    }
    
    private func setupChooseLabel() {
        chooseLabel.text = UI.SettingsUI.chooseText
    }
    
    private func setupNormalButton() {
        normalButton.setTitle(UI.SettingsUI.normal, for: .normal)
        normalButton.addTarget(self, action: #selector(touchedNormalButton), for: .touchUpInside)
    }
    
    private func setupRandomButton() {
        randomButton.setTitle(UI.SettingsUI.random, for: .normal)
        randomButton.addTarget(self, action: #selector(touchedRandomButton), for: .touchUpInside)
    }
}

extension SettingsViewController {
    @objc
    private func touchedNormalButton() {
        GameSession.shared.addQuestions(getQuestions(for: .normal).getQuestions())
        dismiss()
    }
    
    @objc
    private func touchedRandomButton() {
        GameSession.shared.addQuestions(getQuestions(for: .random).getQuestions())
        dismiss()
    }
}
