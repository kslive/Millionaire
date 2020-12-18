//
//  Question.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 18.12.2020.
//

import Foundation

struct Question {
    let id: Int
    let questions: String
    let answers: [[String: Bool]]
    
    static func getNormalQuestions() -> [Question] {
        return [Question(id: 0,
                         questions: Questions.questionOne,
                         answers: [Answer.QuestionOne.a,
                                   Answer.QuestionOne.b,
                                   Answer.QuestionOne.c,
                                   Answer.QuestionOne.d]),
                Question(id: 1,
                                 questions: Questions.questionTwo,
                                 answers: [Answer.QuestionTwo.a,
                                           Answer.QuestionTwo.b,
                                           Answer.QuestionTwo.c,
                                           Answer.QuestionTwo.d]),
                Question(id: 2,
                                 questions: Questions.questionThree,
                                 answers: [Answer.QuestionThree.a,
                                           Answer.QuestionThree.b,
                                           Answer.QuestionThree.c,
                                           Answer.QuestionThree.d]),
                Question(id: 3,
                                 questions: Questions.questionFour,
                                 answers: [Answer.QuestionFour.a,
                                           Answer.QuestionFour.b,
                                           Answer.QuestionFour.c,
                                           Answer.QuestionFour.d]),
                Question(id: 4,
                                 questions: Questions.questionFive,
                                 answers: [Answer.QuestionFive.a,
                                           Answer.QuestionFive.b,
                                           Answer.QuestionFive.c,
                                           Answer.QuestionFive.d])]
    }
}
