//
//  Photos.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 08.09.26.
//

import Foundation

nonisolated
struct Photos: Codable {
    let id: String?
    let author: String?
    let width: Int?
    let height: Int?
    let url: String?
    let downloadUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadUrl = "download_url"
    }
}
