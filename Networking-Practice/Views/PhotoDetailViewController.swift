//
//  PhotoDetailViewController.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 10.09.26.
//

import UIKit
import Kingfisher

class PhotoDetailViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .black
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("✕", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let photo: Photos
    
    init(photo: Photos) {
        self.photo = photo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        
        if let urlString = photo.downloadUrl, let url = URL(string: urlString) {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: url)
        }
    }
    
    private func setupUI() {
        view.addSubview(imageView)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func closeTapped() {
        dismiss(animated: true)
    }
}
