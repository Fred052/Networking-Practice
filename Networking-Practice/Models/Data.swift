//
//  Data.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 05.09.26.
//

import Foundation

nonisolated
struct PostItems: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}
