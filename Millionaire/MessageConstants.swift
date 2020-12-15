//
//  MessageConstants.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import Foundation

enum MessageConstants {
    static let action = "Ок"
    
    enum Error {
        static let title = "Вы ошиблись!"
        static func message(in text: String) -> String {
            return "Вы выбрали: \(text), это была ошибка..."
        }
    }
    
    enum Info {
        static let title = "Правила игры"
        static let message = """
          1 вопрос   ->    100 000 Р
         2 вопроса   ->    250 000 Р
         3 вопроса   ->    500 000 Р
         4 вопроса   ->    750 000 Р
        5 вопросов   ->  1 000 000 Р
        """
    }
    
    enum Success {
        static let title = "Вы выиграли!"
        static let message = "Поздравляем, вы подсмотрели в коде правильные ответы"
    }
}
