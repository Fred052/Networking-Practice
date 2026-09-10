//
//  PhotoCollectionViewCell.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 10.09.26.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var captionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(photoImageView)
        photoImageView.addSubview(captionLabel)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: 180),
            
            captionLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: 12),
            captionLabel.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: -12),
            captionLabel.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with photo: Photos) {
        captionLabel.text = photo.author
        
        if let urlString = photo.downloadUrl, let url = URL(string: urlString) {
            photoImageView.kf.indicatorType = .activity
            photoImageView.kf.setImage(
                with: url,
                placeholder: nil,
                options: [.transition(.fade(0.2)), .cacheOriginalImage]
            )
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.kf.cancelDownloadTask()
        photoImageView.image = nil
    }
}
