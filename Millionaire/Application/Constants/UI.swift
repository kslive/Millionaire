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
        static let resultsTitle = "Правильных ответов:"
        static func percent(in text: String) -> String {
            return "\(text) из 100%"
        }
        static let key = "RecordsResultsUI"
    }
    
    enum QuestionUI {
        static func title(for number: Int) -> String {
            return "Вопрос \(number) из 5"
        }
    }
    
    enum SettingsUI {
        static let title = "Настройки"
        static let chooseText = "Выберите последовательность вопросов:"
        static let normal = "По порядку"
        static let random = "Перемешать"
        static let key = "RecordsSegmentedValueUI"
    }
}
