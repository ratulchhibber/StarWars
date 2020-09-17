//
//  CharactersVM.swift
//  StarWars
//
//  Created by Ratul Chhibber on 16/09/20.
//  Copyright © 2020 Ratul Chhibber. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class CharactersVM {
    var characterModel: Characters?
    var filmModel = [Film]()
    let provider = MoyaProvider<API>()
    let network = NetworkService()
    
    var characters: [String] {
        var characters = [String]()
        characterModel?.results.forEach {
            characters.append($0.name)
        }
        return characters
    }
    
    func getFilmIds(for selectedIndex: Int) -> [String] {
        filmModel.removeAll()
        let characterName = characters[selectedIndex]
        guard let movies = characterModel?.results.first(where: { result -> Bool in
            result.name == characterName
        }) else {
            return []
        }
        
        return movies.films.map({
            ($0.dropLast().components(separatedBy: "/").last ?? "")
        })
    }
}

//MARK: Routing Data Model
struct CharacterDataModel {
    let character: Result?
    let films: [Film]
}

extension CharactersVM {
    
    func dataModel(for index: Int) -> CharacterDataModel {
        return CharacterDataModel(character: characterModel?.results[index],
                                  films: filmModel)
    }
}

//MARK: Network Requests
extension CharactersVM {
    func fetchCharacters() -> Completable {
        return .create { observer in
            self.network.fetchCharacters()
                .subscribe(onSuccess: {
                    self.characterModel = $0
                    observer(.completed)
                }, onError: { error in
                    observer(.error(error))
                })
        }
    }
    
    func fetchFilms(for selectedId: Int) -> Completable {
        let allCompletables = getFilmIds(for: selectedId)
                              .map { fetchFilm(for: $0) }
        return Completable.zip(allCompletables)
    }
    
    private func fetchFilm(for filmId: String)  -> Completable {
        return .create { observer in
            self.network.fetchFilm(for: filmId)
                .subscribe(onSuccess: {
                    self.filmModel.append($0)
                    observer(.completed)
                }, onError: { error in
                    observer(.error(error))
                })
        }
    }
}
