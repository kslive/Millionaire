//
//  QuestionsDataSource.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

class QuestionsDataSource: NSObject, UITableViewDataSource {
    private var questions: [Question]
    private var controller: UIViewController
    private var questionsChanged = GameSession.shared.questionsOutput
    private var index = 0
    
    var nextHandler: ((String, Bool?) -> ())?
    
    init(controller: UIViewController, questions: [Question]) {
        self.controller = controller
        self.questions = questions
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: return setupQuestionsCell(for: tableView, in: indexPath, for: questionsName(for: index))
        case 1: return setupAnswerCell(for: tableView, in: indexPath, for: answerName(for: index, in: 0))
        case 2: return setupAnswerCell(for: tableView, in: indexPath, for: answerName(for: index, in: 1))
        case 3: return setupAnswerCell(for: tableView, in: indexPath, for: answerName(for: index, in: 2))
        default: return setupAnswerCell(for: tableView, in: indexPath, for: answerName(for: index, in: 3))
        }
    }
}

extension QuestionsDataSource {
    private func questionsName(for id: Int) -> String {
        switch questionsChanged.isEmpty {
        case true: return questions[id].questions
        case false: return questionsChanged[id].questions
        }
    }
    
    private func answerName(for id: Int, in count: Int) -> [String: Bool] {
        switch questionsChanged.isEmpty {
        case true: return questions[id].answers[count]
        case false: return questionsChanged[id].answers[count]
        }
    }
}

extension QuestionsDataSource {
    private func setupQuestionsCell(for tableView: UITableView, in indexPath: IndexPath, for text: String) -> UITableViewCell {
        guard let cell: QuestionsCell = tableView.dequeueReusableCell(withIdentifier: String(describing: QuestionsCell.self), for: indexPath) as? QuestionsCell else { return UITableViewCell()}
        cell.setup(for: text)
        return cell
    }
    
    private func setupAnswerCell(for tableView: UITableView, in indexPath: IndexPath, for value: [String: Bool]) -> UITableViewCell {
        guard
            let cell: AnswerCell = tableView.dequeueReusableCell(withIdentifier: String(describing: AnswerCell.self), for: indexPath) as? AnswerCell,
            let text = value.keys.first,
            let isValue = value.values.first
        else { return UITableViewCell()}
        
        cell.setup(for: text) { [weak self] in
            guard let self = self else { return }
            switch self.index {
            case 0...(self.questions.count - 2):
                self.index += 1
                self.nextHandler?(text, isValue)
            default:
                self.nextHandler?("", nil)
            }
        }
        return cell
    }
}
