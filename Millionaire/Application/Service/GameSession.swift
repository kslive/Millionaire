//
//  GameSession.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import Foundation

class GameSession {
    private let recordCaretaker = RecordsCaretaker()
    
    static let shared = GameSession()
    
    var resultsInput: [Result] = []
    var resultsOutput: [Result] {
        didSet {
            recordCaretaker.saveResult(resultsOutput)
        }
    }
    var questionsOutput: [Question] {
        didSet {
            recordCaretaker.saveQuestions(questionsOutput)
        }
    }
    
    private init() {
        self.resultsOutput = recordCaretaker.retrieveResults()
        self.questionsOutput = recordCaretaker.retrieveQuestions()
    }
}

// MARK: - RESULT

extension GameSession {
    func addResultsInput(_ result: Result) {
        resultsInput.append(result)
    }
    
    func deleteResultsInput() {
        resultsInput.removeAll()
    }
    
    func getResultsOutput() {
        let res = Result(countTrue: (resultsInput.count * 100)/5)
        resultsOutput.append(res)
        deleteResultsInput()
    }
}

// MARK: - QUESTIONS

extension GameSession {
    func addQuestions(_ questions: [Question]) {
        deleteQuestions()
        questionsOutput.append(contentsOf: questions)
    }
    
    func deleteQuestions() {
        questionsOutput.removeAll()
    }
}
