//
//  PostDetailViewModel.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 05.09.26.
//

import Foundation

final class PostDetailViewModel {
    let item: PostItems
    
    var manager = NetworkManager()
    
    var comments: [Comments] = []
    var updateUI: (() -> Void)?
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    init(item: PostItems) {
        self.item = item
    }
    
    func getComments() {
        manager.request(model: [Comments].self,
                        endpoint: "comments") { comments, error in
            if let error {
                self.error?(error)
            } else if let comments {
                self.comments = comments
                self.success?()
            }
        }
    }
    
    var name: String? {
        comments.first?.name
    }
    
    var email: String? {
        comments.first?.email
    }
    
    var body: String? {
        comments.first?.body
    }
    
}
