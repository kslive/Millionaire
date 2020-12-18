//
//  Question.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 18.12.2020.
//

import Foundation

struct Question: Codable {
    let id: Int
    let questions: String
    let answers: [[String: Bool]]
}
