//
//  ViewManager.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

class ViewManager {
    static let shared = ViewManager()
    
    private init() {}
    
    func showQuestions(_ controller: UIViewController) {
        let questionsViewController = UIStoryboard(name: String(describing: QuestionsViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: QuestionsViewController.self)) as! QuestionsViewController
        controller.present(questionsViewController, animated: true)
    }
    
    func showResults(_ controller: UIViewController) {
        let resultsViewController = UIStoryboard(name: String(describing: ResultsViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ResultsViewController.self)) as! ResultsViewController
        controller.present(resultsViewController, animated: true)
    }
    
    func showSettings(_ controller: UIViewController) {
        let settingsViewController = UIStoryboard(name: String(describing: SettingsViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: SettingsViewController.self)) as! SettingsViewController
        controller.present(settingsViewController, animated: true)
    }
}
