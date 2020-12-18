//
//  RecordsCaretaker.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import Foundation

class RecordsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
}

// MARK: - RESULT

extension RecordsCaretaker {
    func saveResult(_ result: [Result]) {
        do {
            let data = try encoder.encode(result)
            UserDefaults.standard.set(data, forKey: UI.ResultsUI.key)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func retrieveResults() -> [Result] {
        guard let data = UserDefaults.standard.data(forKey: UI.ResultsUI.key) else { return [] }
        do {
            return try decoder.decode([Result].self, from: data)
        } catch let error {
            print(error.localizedDescription)
            return []
        }
    }
}

// MARK: - QUESTIONS

extension RecordsCaretaker {
    func saveQuestions(_ question: [Question]) {
        do {
            let data = try encoder.encode(question)
            UserDefaults.standard.set(data, forKey: UI.SettingsUI.key)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func retrieveQuestions() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: UI.SettingsUI.key) else { return [] }
        do {
            return try decoder.decode([Question].self, from: data)
        } catch let error {
            print(error.localizedDescription)
            return []
        }
    }
}
