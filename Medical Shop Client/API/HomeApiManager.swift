//
//  HomeApiManager.swift
//  Medical Shop Client
//
//  Created by apple on 09/05/2022.
//

import Foundation
import Alamofire

class HomeApiManager {
    public static let shared = HomeApiManager()
    
    func getHomeData(completion: @escaping(_ data: HomeBaseModel, _: Error?) -> Void) {
        AF.request(URLs.home, method: .get).responseDecodable(of: HomeBaseModel.self) { response in
            debugPrint(response)
            guard let data = response.data else {return}
            
            switch response.result {
            case .success(_):
                do {
                    let json = try JSONDecoder().decode(HomeBaseModel.self, from: data)
                    completion(json, nil)
                } catch let err {
                    completion(HomeBaseModel() , err)
                }
            case .failure(let err):
                completion(HomeBaseModel() , err)
            }
        }
    }
}
