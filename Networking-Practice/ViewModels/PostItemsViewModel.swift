//
//  PostItemsViewModel.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 05.09.26.
//

import Foundation

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
}
