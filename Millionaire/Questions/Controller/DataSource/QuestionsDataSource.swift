//
//  QuestionsDataSource.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

enum QuestionsState {
    case questionsOne
    case questionsTwo
    case questionsThree
    case questionsFour
    case questionsFive    
}

class QuestionsDataSource: NSObject, UITableViewDataSource {
    
    var controller: UIViewController
    var state: QuestionsState = .questionsOne
    var nextHandler: ((String) -> Void)?
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch state {
        case .questionsOne:
            switch indexPath.row {
            case 0: return setupQuestionsCell(for: tableView, in: indexPath, for: Questions.questionOne)
            case 1: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionOne.a)
            case 2: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionOne.b)
            case 3: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionOne.c)
            default: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionOne.d)
            }
        case .questionsTwo:
            switch indexPath.row {
            case 0: return setupQuestionsCell(for: tableView, in: indexPath, for: Questions.questionTwo)
            case 1: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionTwo.a)
            case 2: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionTwo.b)
            case 3: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionTwo.c)
            default: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionTwo.d)
            }
        case .questionsThree:
            switch indexPath.row {
            case 0: return setupQuestionsCell(for: tableView, in: indexPath, for: Questions.questionThree)
            case 1: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionThree.a)
            case 2: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionThree.b)
            case 3: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionThree.c)
            default: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionThree.d)
            }
        case .questionsFour:
            switch indexPath.row {
            case 0: return setupQuestionsCell(for: tableView, in: indexPath, for: Questions.questionFour)
            case 1: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionFour.a)
            case 2: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionFour.b)
            case 3: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionFour.c)
            default: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionFour.d)
            }
        case .questionsFive:
            switch indexPath.row {
            case 0: return setupQuestionsCell(for: tableView, in: indexPath, for: Questions.questionFive)
            case 1: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionFive.a)
            case 2: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionFive.b)
            case 3: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionFive.c)
            default: return setupAnswerCell(for: tableView, in: indexPath, for: Answer.QuestionFive.d)
            }
        }
    }
}

extension QuestionsDataSource {
    private func setupQuestionsCell(for tableView: UITableView, in indexPath: IndexPath, for text: String) -> UITableViewCell {
        guard let cell: QuestionsCell = tableView.dequeueReusableCell(withIdentifier: String(describing: QuestionsCell.self), for: indexPath) as? QuestionsCell else { return UITableViewCell()}
        cell.setup(for: text)
        return cell
    }
    
    private func setupAnswerCell(for tableView: UITableView, in indexPath: IndexPath, for text: String) -> UITableViewCell {
        guard let cell: AnswerCell = tableView.dequeueReusableCell(withIdentifier: String(describing: AnswerCell.self), for: indexPath) as? AnswerCell else { return UITableViewCell()}
        cell.setup(for: text) { [weak self] in
            guard let self = self else { return }
            self.nextHandler?(text)
        }
        return cell
    }
}
