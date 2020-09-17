//
//  CharctersTests.swift
//  StarWars
//
//  Created by Ratul Chhibber on 17/09/20.
//  Copyright © 2020 Ratul Chhibber. All rights reserved.
//

import XCTest
import Moya
import RxSwift
@testable import StarWars

class CharctersTests: XCTestCase {
    
    var mockCharacterModel: Characters!
    
    override func setUp() {
        super.setUp()
        let jsonData = ServiceMock.getJsonAsData(filename: "characters")
        mockCharacterModel = try? JSONDecoder().decode(Characters.self, from: jsonData)
    }
    
    func testCharacters() {
        let characterCount = mockCharacterModel.results.count
        XCTAssertTrue(characterCount == 10, "The mock response count is invalid")
    }
    
    func testFilmIdsForFirstCharacter() {
        let viewModel = CharactersVM()
        viewModel.characterModel = mockCharacterModel
        let filmIds = viewModel.getFilmIds(for: 0)
        XCTAssertTrue(filmIds.elementsEqual(["1", "2", "3", "6"]), "The film ids were not extracted correctly")
    }
    
}
