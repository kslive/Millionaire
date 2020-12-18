//
//  NormalToRandomQuestions.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 18.12.2020.
//

import Foundation

enum QuestionsState {
    case normal, random
}

protocol NormalToRandomQuestions {
    func getQuestions() -> [Question]
}
