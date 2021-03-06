//
//  ResultsViewController.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: ResultsDataSource?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension ResultsViewController {
    private func setup() {
        setupTitle()
        setupTableView()
    }
    
    private func setupTitle() {
        titleLabel.text = UI.ResultsUI.title
    }
    
    private func setupTableView() {
        dataSource = ResultsDataSource(controller: self)
        
        tableView.dataSource = dataSource
        tableView.register(UINib(nibName: String(describing: ResultsCell.self), bundle: .main) , forCellReuseIdentifier: String(describing: ResultsCell.self))
        tableView.separatorStyle = .none
    }
}

