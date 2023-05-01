//
//  HomePresenter.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit

protocol HomePresentationLogic {
    func reloadCharacters()
    func showToast(message: String, state: ToastState)
}

class HomePresenter: HomePresentationLogic {

    weak var viewController: HomeDisplayLogic?

    // MARK: - HomePresentationLogic
    func reloadCharacters() {
        viewController?.reloadCharacters()
    }

    func showToast(message: String, state: ToastState) {
        viewController?.showToast(message: message, state: state)
    }
}
