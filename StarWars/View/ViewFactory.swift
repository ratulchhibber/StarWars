//
//  ViewFactory.swift
//  StarWars
//
//  Created by Ratul Chhibber on 16/09/20.
//  Copyright © 2020 Ratul Chhibber. All rights reserved.
//

import UIKit

class ViewFactory {
    
    private init() { }
    
    static func createDetailView(for model: CharacterDataModel) -> CharacterDetailVC? {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        guard
            let view = storyboard
                       .instantiateViewController(withIdentifier: "CharacterDetailVC") as? CharacterDetailVC else { return nil }
        let viewModel = CharacterDetailVM(with: model)
        view.configure(with: viewModel)
        return view
    }
}
