//
//  GitRouter.swift
//  GitMVP
//
//  Created by Mahmoud Aziz on 29/05/2021.
//

import Foundation
import Alamofire

enum GitRouter: URLRequestConvertible {
    
    static let baseURL = "https://api.github.com/users"
    
    case user
    case repos
    
    var httpMethod: HTTPMethod {
        switch self {
        case .user:
            return .get
        case .repos:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .user:
            return "/mahmoud-aziz"
        case .repos:
            return "/mahmoud-aziz/repos"
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .user :
            return nil
        case .repos:
            return nil
        }
    }

    var headers: [String: String] {
        switch self {
        case .user:
            return [:]
        case .repos:
            return [:]
        }
    }

    var encoding: ParameterEncoding {
        switch self {
        case .user:
            return JSONEncoding.default
        case .repos:
            return JSONEncoding.default
        }
    }

    func asURLRequest() throws -> URLRequest {
        let urlString = GitRouter.baseURL + self.path
        let url = URL(string: urlString)!

        var request = URLRequest(url: url)
        request.method = self.httpMethod
        request.headers = HTTPHeaders(headers)

        return try! encoding.encode(request, with: parameters)
    }
}
