//
//  QuestionsViewController.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

class QuestionsViewController: UIViewController {
    private var countResult = 0
    private var questions = Question.getAllQuestions()
    
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
}

extension QuestionsViewController {
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        dataSource = QuestionsDataSource(controller: self, questions: questions)
        dataSource?.nextHandler = { [weak self] text, isValue in
            guard let self = self else { return }
            switch isValue {
            case false: Message.shared.show(.error(message: text), sender: self)
            default:
                self.countResult += 1
                self.tableView.reloadData()
                if isValue == nil {
                    Message.shared.show(.success(message: MessageConstants.Success.message), sender: self)
                }
            }
            GameSession.shared.addResultsInput(Result(countTrue: self.countResult))
        }
        
        tableView.dataSource = dataSource
        tableView.register(UINib(nibName: String(describing: QuestionsCell.self), bundle: .main) , forCellReuseIdentifier: String(describing: QuestionsCell.self))
        tableView.register(UINib(nibName: String(describing: AnswerCell.self), bundle: .main) , forCellReuseIdentifier: String(describing: AnswerCell.self))
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
}
