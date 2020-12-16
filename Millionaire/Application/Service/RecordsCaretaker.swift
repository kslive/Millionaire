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
    
    private let key = UI.ResultsUI.key
    
    func save(_ result: [Result]) {
        do {
            let data = try encoder.encode(result)
            UserDefaults.standard.set(data, forKey: key)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func retrieveResults() -> [Result] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try decoder.decode([Result].self, from: data)
        } catch let error {
            print(error.localizedDescription)
            return []
        }
    }
}
