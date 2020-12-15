//
//  QuestionsViewController.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

class QuestionsViewController: UIViewController {
    private var countResult = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: QuestionsDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        GameSession.shared.getResultsOutput()
    }
    
    private func validate(text: String, trueText: String) -> Bool {
        return text == trueText
    }
}

extension QuestionsViewController {
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        dataSource = QuestionsDataSource(controller: self)
        dataSource?.nextHandler = { [weak self] text in
            guard let self = self else { return }
            switch self.dataSource?.state {
            case .questionsOne:
                if self.validate(text: text, trueText: Answer.QuestionOne.b) {
                    self.dataSource?.state = .questionsTwo
                    self.countResult += 1
                } else {
                    Message.shared.show(MessageType.error(message: text), sender: self)
                }
            case .questionsTwo:
                if self.validate(text: text, trueText: Answer.QuestionTwo.b) {
                    self.dataSource?.state = .questionsThree
                    self.countResult += 1
                } else {
                    Message.shared.show(MessageType.error(message: text), sender: self)
                }
            case .questionsThree:
                if self.validate(text: text, trueText: Answer.QuestionThree.c) {
                    self.dataSource?.state = .questionsFour
                    self.countResult += 1
                } else {
                    Message.shared.show(MessageType.error(message: text), sender: self)
                }
            case .questionsFour:
                if self.validate(text: text, trueText: Answer.QuestionFour.c) {
                    self.dataSource?.state = .questionsFive
                    self.countResult += 1
                } else {
                    Message.shared.show(MessageType.error(message: text), sender: self)
                }
            case .questionsFive:
                if self.validate(text: text, trueText: Answer.QuestionFive.a) {
                    Message.shared.show(MessageType.success(message: MessageConstants.Success.message), sender: self)
                    self.countResult += 1
                } else {
                    Message.shared.show(MessageType.error(message: text), sender: self)
                }
            default:
                self.dismiss(animated: true)
            }
            
            let result = Result(countTrue: self.countResult)
            GameSession.shared.addResultsInput(result)
            
            self.tableView.reloadData()
        }
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: QuestionsCell.self), bundle: .main) , forCellReuseIdentifier: String(describing: QuestionsCell.self))
        tableView.register(UINib(nibName: String(describing: AnswerCell.self), bundle: .main) , forCellReuseIdentifier: String(describing: AnswerCell.self))
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
}

extension QuestionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
