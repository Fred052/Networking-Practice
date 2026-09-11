//
//  AlbumsViewModel.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 06.09.26.
//

import Foundation

final class AlbumsViewModel {
    var manager = NetworkManager()
    var albums: [Albums] = []
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    var numberOfRows: Int {
        albums.count
    }
    
    func albums(at index: Int) -> Albums {
        albums[index]
    }
    
    func getAlbums() {
        manager.request(model: [Albums].self,
                        endpoint: .album) { albums, error in
            if let error {
                self.error?(error)
            } else if let albums {
                self.albums = albums
                self.success?()
            }
        }
    }
}
