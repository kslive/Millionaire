//
//  GameSession.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import Foundation

class GameSession {
    static let shared = GameSession()
    
    var resultsInput: [Result] = []
    var resultsOutput: [Result] = []
    
    private init() {}
    
    func addResult(_ result: Result) {
        resultsInput.append(result)
    }
    
    func deleteResults() {
        resultsInput.removeAll()
    }
    
    func getResultsGame() {
        let res = Result(countTrue: (self.resultsInput.count * 100)/5)
        resultsOutput.append(res)
        deleteResults()
    }
}
