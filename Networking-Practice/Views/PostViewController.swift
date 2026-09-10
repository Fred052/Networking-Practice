//
//  PostViewController.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 05.09.26.
//

import UIKit

class PostViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let viewModel = PostItemsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Posts"
        
        setupView()
        configureViewModel()
    }
    
    func setupView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureViewModel() {
        viewModel.getdata()
        viewModel.success = {
            self.tableView.reloadData()
        }
        viewModel.error = { message in
            print(message)
        }
    }
}

extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let item = viewModel.items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.body
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = viewModel.items[indexPath.row]
        let detailVC = PostDetailViewController(item: item)
        navigationController?.pushViewController(detailVC, animated: true)
        print(item.title)
    }
    
    
}
