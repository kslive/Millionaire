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
            recordCaretaker.save(resultsOutput)
        }
    }
    
    private init() {
        self.resultsOutput = recordCaretaker.retrieveResults()
    }
    
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
