//
//  UsersDetailViewController.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 06.09.26.
//

import UIKit

class UsersDetailViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let viewModel: UserDetailViewModel
    
    init(user: Users) {
        self.viewModel = UserDetailViewModel(user: user)
        super.init(nibName: nil, bundle: nil)
        self.title = user.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DetailCell")
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func backTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension UsersDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "DetailCell")
        let row = viewModel.row(at: indexPath.row)
        cell.textLabel?.text = row.title
        cell.detailTextLabel?.text = row.value
        return cell
    }
    
    
}



