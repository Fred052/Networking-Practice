//
//  UserDetailViewModel.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 06.09.26.
//

import Foundation

final class UserDetailViewModel {
    let user: Users
    
    init(user: Users) {
        self.user = user
    }
    
    var rows: [(title: String, value: String)] {
        [
            ("Username", user.username ?? "-"),
            ("Email", user.email ?? "-"),
            ("Phone", user.phone ?? "-"),
            ("Website", user.website ?? "-"),
            ("Street", user.address?.street ?? "-"),
            ("Suite", user.address?.suite ?? "-"),
            ("City", user.address?.city ?? "-"),
            ("Zipcode", user.address?.zipcode ?? "-"),
            ("Company", user.company?.name ?? "-"),
            ("Catch Phrase", user.company?.catchPhrase ?? "-")
        ]
    }
    
    var numberOfRows: Int {
        rows.count
    }
    
    func row(at index: Int) -> (title: String, value: String) {
        rows[index]
    }
}
