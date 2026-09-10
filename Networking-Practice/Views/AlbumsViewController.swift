//
//  AlbumsViewController.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 05.09.26.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let viewModel = AlbumsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Albums"
        
        setupTableView()
        configureViewModel()
        viewModel.getAlbums()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AlbumsCell")

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureViewModel() {
        viewModel.success = {[weak self] in
            self?.tableView.reloadData()
        }
        viewModel.error = {[weak self] message in
            print(message)
        }
    }
}

extension AlbumsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumsCell", for: indexPath)
        let albums = viewModel.albums(at: indexPath.row)
        cell.textLabel?.text = albums.title
        return cell
    }
}
