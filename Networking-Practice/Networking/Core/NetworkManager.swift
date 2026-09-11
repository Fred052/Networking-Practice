//
//  NetworkManager.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 05.09.26.
//

import Foundation
import Alamofire

enum EncodingType {
    case url, json
}

class NetworkManager {
    
    let baseURL = "https://jsonplaceholder.typicode.com/"
    
    func request<T: Codable>(model: T.Type,
                             endpoint: Endpoint,
                             method: HTTPMethod = .get,
                             parameter: Parameters? = nil,
                             encoding: EncodingType = .url,
                             completion: @escaping (T?, String?) -> Void) {
        
        AF.request("\(baseURL)\(endpoint.rawValue)",
                   method: method,
                   encoding: encoding == .url ? URLEncoding.default : JSONEncoding.default
        ).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decodeData = try JSONDecoder().decode(T.self, from: data)
                    completion(decodeData, nil)
                } catch {
                    completion(nil, error.localizedDescription)
                }
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func requestPhotos<T: Codable>(model: T.Type,
                             url: String,
                             completion: @escaping (T?, String?) -> Void) {
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let photos):
                do {
                    let decodeData = try JSONDecoder().decode(T.self, from: photos)
                    completion(decodeData, nil)
                } catch {
                    completion(nil, error.localizedDescription)
                }
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
