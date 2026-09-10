//
//  NetworkManager.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 05.09.26.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func getData(completion: @escaping(([PostItems]?, String?) -> Void)) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        AF.request(url).responseDecodable(of: [PostItems].self) { response in
            switch response.result {
            case .success(let items):
                completion(items, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func getComments(postId: Int, completion: @escaping(([Comments]?, String?) -> Void)) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments")!
        AF.request(url).responseDecodable(of: [Comments].self) { response in
            switch response.result {
            case .success(let comments):
                completion(comments, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            
            }
        }
    }
    
    func getAlbums(completion: @escaping(([Albums]?, String?) -> Void)) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/albums")!
        AF.request(url).responseDecodable(of: [Albums].self) { response in
            switch response.result {
            case .success(let albums):
                completion(albums, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func getUsers(completion: @escaping(([Users]?, String?) -> Void)) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        AF.request(url).responseDecodable(of: [Users].self) { response in
            switch response.result {
            case .success(let users):
                completion(users, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func getPhotos(completion: @escaping(([Photos]?, String?) -> Void)) {
        let url = URL(string: "https://picsum.photos/v2/list")!
        AF.request(url).responseDecodable(of: [Photos].self) { response in
            switch response.result {
            case .success(let photos):
                completion(photos, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
