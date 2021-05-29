//
//  GitRequest.swift
//  GitMVP
//
//  Created by Mahmoud Aziz on 29/05/2021.
//

import Foundation
import Alamofire


class GitRequest {
    
    func retrieveAllRepos(
        _ completionHandler: @escaping (Result<[Repo], AFError>) -> Void
    ) {
        let route = GitRouter.repos

        AF.request(route).responseDecodable { (response: DataResponse<[Repo], AFError>) in

            switch response.result {
            case .success(let repos):
                completionHandler(.success(repos))
            case .failure(let error):
                completionHandler(.failure(error))
            }
            
        }
    }
    
    func retrieveUserInfo(
        _ completionHandler: @escaping (Result<User, AFError>) -> Void
    ) {
        let route = GitRouter.user

        AF.request(route).responseDecodable { (response: DataResponse<User, AFError>) in

            switch response.result {
            case .success(let user):
                completionHandler(.success(user))
            case .failure(let error):
                completionHandler(.failure(error))
            }
            
        }
    }
}

