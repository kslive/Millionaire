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
}

extension QuestionsViewController {
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        dataSource = QuestionsDataSource(controller: self)
        dataSource?.nextHandler = { [weak self] in
            guard let self = self else { return }
            switch self.dataSource?.state {
            case .questionsOne: self.dataSource?.state = .questionsTwo
            case .questionsTwo: self.dataSource?.state = .questionsThree
            case .questionsThree: self.dataSource?.state = .questionsFour
            case .questionsFour: self.dataSource?.state = .questionsFive
            default: self.dismiss(animated: true)
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
