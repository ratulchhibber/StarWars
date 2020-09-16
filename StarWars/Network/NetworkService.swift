//
//  NetworkService.swift
//  StarWars
//
//  Created by Ratul Chhibber on 16/09/20.
//  Copyright © 2020 Ratul Chhibber. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol NetworkServiceProtocol {
    func fetchCharacters() -> Single<Characters>
    func fetchFilm(for id: String) -> Single<Film>
}

class NetworkService: NetworkServiceProtocol {
    
    private let provider = MoyaProvider<API>()

    func fetchCharacters() -> Single<Characters> {
        return provider.rx.request(.fetchCharacters)
            .filterSuccessfulStatusAndRedirectCodes()
            .map(Characters.self)
    }
    
    func fetchFilm(for id: String) -> Single<Film> {
        return provider.rx.request(.fetchFilmDetails(id: id))
        .filterSuccessfulStatusAndRedirectCodes()
        .map(Film.self)
    }
}
