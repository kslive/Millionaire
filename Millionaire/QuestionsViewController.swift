//
//  QuestionsViewController.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: QuestionsDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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
                } else {
                    Message.shared.show(MessageType.error(message: text), sender: self)
                }
            case .questionsTwo:
                if self.validate(text: text, trueText: Answer.QuestionTwo.b) {
                    self.dataSource?.state = .questionsThree
                } else {
                    Message.shared.show(MessageType.error(message: text), sender: self)
                }
            case .questionsThree:
                if self.validate(text: text, trueText: Answer.QuestionThree.c) {
                    self.dataSource?.state = .questionsFour
                } else {
                    Message.shared.show(MessageType.error(message: text), sender: self)
                }
            case .questionsFour:
                if self.validate(text: text, trueText: Answer.QuestionFour.c) {
                    self.dataSource?.state = .questionsFive
                } else {
                    Message.shared.show(MessageType.error(message: text), sender: self)
                }
            case .questionsFive:
                if self.validate(text: text, trueText: Answer.QuestionFive.a) {
                    Message.shared.show(MessageType.success(message: MessageConstants.Success.message), sender: self)
                } else {
                    Message.shared.show(MessageType.error(message: text), sender: self)
                }
            default:
                self.dismiss(animated: true)
            }
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
