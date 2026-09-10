//
//  Comments.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 06.09.26.
//

import Foundation

nonisolated
struct Comments: Codable {
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
}
