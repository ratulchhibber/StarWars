//
//  CharactersVC.swift
//  StarWars
//
//  Created by Ratul Chhibber on 15/09/20.
//  Copyright © 2020 Ratul Chhibber. All rights reserved.
//

import UIKit
import Lottie
import RxSwift

class CharactersVC: UIViewController {
    
    @IBOutlet private var charactersTableView: UITableView!
    private let disposeBag = DisposeBag()
    
    private let viewModel = CharactersVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Star Wars: Characters".localized()
        triggerFetchCharacters()
    }
    
    private func triggerFetchCharacters() {
        ActivityIndicator.shared.show(in: view)
        viewModel.fetchCharacters()
            .subscribe(onCompleted: {
                ActivityIndicator.shared.hide()
                self.charactersTableView.reloadData()
            }, onError: { error in
                ActivityIndicator.shared.hide()
                // Show alert
            }).disposed(by: disposeBag)
    }
    
    private func triggerFetchFilms(for index: Int) {
        ActivityIndicator.shared.show(in: view)
        viewModel.fetchFilms(for: index)
            .subscribe(onCompleted: {
                ActivityIndicator.shared.hide()
                self.routeToCharacterDetails(for: index)
            }) { (error) in
                ActivityIndicator.shared.hide()

                // show alert
        }.disposed(by: disposeBag)
    }
    
    private func routeToCharacterDetails(for index: Int) {
        let model = viewModel.dataModel(for: index)
        guard let view = ViewFactory.createDetailView(for: model) else {
            return
        }
        navigationController?.pushViewController(view, animated: true)
    }
}

extension CharactersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterTitle",
                                                 for: indexPath)
        cell.textLabel?.text = viewModel.characters[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
}

extension CharactersVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        triggerFetchFilms(for: indexPath.row)
    }
}
