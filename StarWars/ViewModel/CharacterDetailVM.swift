//
//  CharacterDetailVM.swift
//  StarWars
//
//  Created by Ratul Chhibber on 16/09/20.
//  Copyright © 2020 Ratul Chhibber. All rights reserved.
//

import Foundation

class CharacterDetailVM {
    
    enum SectionType {
        case attributes, films
    }
    
    enum RowType {
        case name, birthYear, height, mass, hairColor, skinColor, eyeColor, gender, film, crawlCharacter
    }
    
    var model: CharacterDataModel?
    
    init(with model: CharacterDataModel) {
        self.model = model
    }
    
    private lazy var sections: [SectionType] = {
        var sections: [SectionType] = [.attributes]
        model?.films.forEach{ _ in sections.append(.films) }
        return sections
    }()
    
    var sectionCount: Int {
        return sections.count
    }
    
    func rowCount(for index: Int) -> Int {
        switch sectionType(for: index) {
        case .attributes:
            return attributeRows.count
        case .films:
            return singleFilmRows.count
        }
    }
    
    private var attributeRows: [RowType] {
        let rows: [RowType] = [
                                .name, .birthYear, .height, .mass, .hairColor,
                                .skinColor, .eyeColor, .gender
                              ]
        return rows
    }
    
    private var singleFilmRows: [RowType] {
        let rows: [RowType] = [.film, .crawlCharacter]
        return rows
    }
    
    private func sectionType(for index: Int) -> SectionType {
        return sections[index]
    }
    
    private func rowType(for index: IndexPath) -> RowType {
        switch sectionType(for: index.section) {
        case .attributes:
            return attributeRows[index.row]
        case .films:
            return singleFilmRows[index.row]
        }
    }
    
    func rowDetails(for index: IndexPath) -> (description: String, value: String?) {
        
        let section = sectionType(for: index.section)
        let row = rowType(for: index)
        
        switch (section, row) {
        case (.attributes, .name):
            return ("Name".localized(), model?.character?.name)
        case (.attributes, .birthYear):
            return ("Birth Year".localized(), model?.character?.birthYear)
        case (.attributes, .height):
            return ("Height".localized(), model?.character?.height)
        case (.attributes, .mass):
            return ("Mass".localized(), model?.character?.mass)
        case (.attributes, .hairColor):
            return ("Hair Color".localized(), model?.character?.hairColor)
        case (.attributes, .skinColor):
            return ("Skin Color".localized(), model?.character?.skinColor)
        case (.attributes, .eyeColor):
            return ("Eye Color".localized(), model?.character?.eyeColor)
        case (.attributes, .gender):
            return ("Gender".localized(), model?.character?.gender.rawValue)
        case (.films, .film):
            return ("Film".localized(), film(for: index)?.title)
        case (.films, .crawlCharacter):
            return ("Opening crawl".localized(),
                    "\(film(for: index)?.openingCrawl.count ?? 0)")
        default:
            return ("", "")
        }
    }
    
    private func film(for index: IndexPath) -> Film? {
        guard let films = model?.films else {
            return nil
        }
        return films[index.section - 1]
    }
}
