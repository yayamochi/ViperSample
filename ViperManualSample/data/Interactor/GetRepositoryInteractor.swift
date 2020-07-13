//
//  GetRepositoryInteractor.swift
//  ViperManualSample
//
//  Created by Yaya Watanabe on 2020/07/12.
//  Copyright © 2020 Yaya Watanabe. All rights reserved.
//

import Alamofire

protocol GetRepositoryUseCase: AnyObject {
    func fetchTrendingRepositories(completion: @escaping  (AFDataResponse<Any>) -> Void)
}

final class GetRepositoryInteractor {
    private var repositories: [Repository]?
}


extension GetRepositoryInteractor: GetRepositoryUseCase {
    

    func fetchTrendingRepositories(completion: @escaping (AFDataResponse<Any>) -> Void)  {
        let baseUrl = "https://ghapi.huchen.dev/developers"
        let parameters: [String: Any] = ["language": "javascript", "since": "weekly"]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        AF.request(baseUrl, method: .get, parameters: parameters, encoding:  URLEncoding(destination: .queryString), headers: headers).responseJSON { response in
            completion(response)
        }

    }
}
