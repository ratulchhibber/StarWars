//
//  API.swift
//  StarWars
//
//  Created by Ratul Chhibber on 16/09/20.
//  Copyright © 2020 Ratul Chhibber. All rights reserved.
//

import Foundation
import Moya

enum APIError: Error {
    case badConnection
    case badResponse
}

enum API {
    case fetchCharacters
    case fetchFilmDetails(id: String)
}

extension API: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://swapi.dev/api") else {
            fatalError("Base URL is invalid")
        }
        return url
    }

    var path: String {
        switch self {
        case .fetchCharacters:
            return "/people"
        case .fetchFilmDetails(let id):
            return "/films/\(id)"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return nil
    }
}
