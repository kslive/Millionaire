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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension SettingsViewController {
    private func setup() {
        setupTitleLabel()
        setupChooseLabel()
        setupSegmentedControl()
    }
    
    private func setupTitleLabel() {
        titleLabel.text = UI.SettingsUI.title
    }
    
    private func setupChooseLabel() {
        chooseLabel.text = UI.SettingsUI.chooseText
    }
    
    private func setupSegmentedControl() {
        segmentedControl.setTitle(UI.SettingsUI.normal, forSegmentAt: 0)
        segmentedControl.setTitle(UI.SettingsUI.random, forSegmentAt: 1)
        segmentedControl.addTarget(self, action: #selector(chooseSegmentedIndex), for: .valueChanged)
    }
    
    private func getQuestions(for state: QuestionsState) -> NormalToRandomQuestions {
        switch state {
        case .normal: return NormalQuestions()
        case .random: return RandomQuestions()
        }
    }
}

extension SettingsViewController {
    @objc
    private func chooseSegmentedIndex() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            GameSession.shared.addQuestions(getQuestions(for: .normal).getQuestions())
        case 1:
            GameSession.shared.addQuestions(getQuestions(for: .random).getQuestions())
        default: break
        }
    }
}
