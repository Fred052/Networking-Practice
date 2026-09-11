//
//  UserViewModel.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 06.09.26.
//

import Foundation

final class UserViewModel {
    var manager = NetworkManager()
    var users: [Users] = []
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    var numberOfRows: Int {
        users.count
    }
    
    func user(at index: Int) -> Users {
        users[index]
    }

    func getUsers() {
        manager.request(model: [Users].self,
                        endpoint: "users")  { users, error in
            if let error {
                self.error?(error)
            } else if let users {
                self.users = users
                self.success?()
            }
        }
    }
}
