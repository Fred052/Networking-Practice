//
//  UsersViewController.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 05.09.26.
//

import UIKit

class UsersViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Users"
        setupCollectionView()
        configureViewModel()
        viewModel.getUsers()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: UserCollectionViewCell.identifier)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureViewModel() {
        viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
        }
        viewModel.error = { message in
            print(message)
        }
    }
}

extension UsersViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.identifier, for: indexPath) as? UserCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: viewModel.user(at: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 32
        return CGSize(width: width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = viewModel.user(at: indexPath.item)
        let detailVC = UsersDetailViewController(user: user)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
