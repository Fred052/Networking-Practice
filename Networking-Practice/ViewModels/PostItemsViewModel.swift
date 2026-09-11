//
//  PostItemsViewModel.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 05.09.26.
//

import Foundation
import Alamofire

final class PostItemsViewModel {
    var items: [PostItems] = []
    
    let manager = NetworkManager()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getdata() {
        manager.request(model: [PostItems].self,
                        endpoint: .post) { data, error in
            if let error {
                self.error?(error)
            } else if let  data {
                self.items = data
                self.success?()
            }
        }
    }
    
    func addNewItem(title: String, body: String) {
        let data: [String: Any] = ["userId": 1, "title": title, "body": "Foo"]
        let item = PostItems(userId: 1, id: nil, title: title, body: "Foo")
        
        manager.request(model: PostItems.self,
                        endpoint: .post,
                        method: .post,
                        parameter: data,
                        encoding: .json) { data, error in
            if let error {
                self.error?(error)
            } else if let data {
                self.items.insert(data, at: 0)
                self.success?()
            }

        }
    }
}
