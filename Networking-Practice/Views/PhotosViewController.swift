//
//  PhotosViewController.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 05.09.26.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let viewModel = PhotosViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Photos"
        setupCollectionView()
        configureViewModel()
        viewModel.getPhotos()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        
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

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: viewModel.photo(at: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = viewModel.photo(at: indexPath.item)
        let detailVC = PhotoDetailViewController(photo: photo)
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true)
    }
}
