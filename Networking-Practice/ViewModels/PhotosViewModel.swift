//
//  PhotosViewModel.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 08.09.26.
//

import Foundation

final class PhotosViewModel {
    var manager = NetworkManager()
    var photos: [Photos] = []
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    var numberOfRows: Int {
        photos.count
    }
    
    func photo(at index: Int) -> Photos {
        photos[index]
    }
    
    func getPhotos() {
        manager.requestPhotos(model: [Photos].self, url: "https://picsum.photos/v2/list") { photos, error in
            if let error {
                self.error?(error)
            } else if let photos {
                self.photos = photos
                self.success?()
            }
        }
    }
}
