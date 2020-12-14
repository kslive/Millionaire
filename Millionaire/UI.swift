//
//  UI.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import Foundation

enum UI {
    enum PresentUI {
        static let title = "Millionaire"
        static let start = "Играть"
        static let result = "Результаты"
    }
    
    enum ResultsUI {
        static let title = "Результаты"
        static let resultsTitle = "Проценты:"
        static func percent(in text: String) -> String {
            return "\(text) из 100%"
        }
    }
}
