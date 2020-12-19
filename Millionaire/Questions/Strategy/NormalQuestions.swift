//
//  NormalQuestions.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 18.12.2020.
//

import UIKit

class NormalQuestions: NormalToRandomQuestions {
    func getQuestions() -> [Question] {
        let questions = Question.getAllQuestions()
        return questions
    }
}
