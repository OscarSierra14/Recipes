//
//  HomeInteractor.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit

protocol HomeBusinessLogic {
    var recipesList: Home.RecipesListResponse? { get set }
    var recipesListBackUp: Home.RecipesListResponse? { get set }
    func viewDidLoad()
    func fetchCharacters()
    func searchRecipe(text: String)
}

protocol HomeDataStore {
    var selectedRecipe: Home.RecipesListResponse.RecipesResponse? { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    enum HomeInteractorConstant: String {
        case noInternetMessage = "You don't have internet connection"
    }

    // MARK: - Attributes
    var recipesList: Home.RecipesListResponse?
    var recipesListBackUp: Home.RecipesListResponse?
    var selectedRecipe: Home.RecipesListResponse.RecipesResponse?
    var presenter: HomePresentationLogic?
    var worker: HomeWorkerProtocol?

    // MARK: - HomeDataStore

    init(worker: HomeWorkerProtocol = HomeWorker()) {
        self.worker = worker
    }

    // MARK: - HomeBusinessLogic
    func viewDidLoad() {
        fetchCharacters()
    }

    func fetchCharacters() {
        worker?.fetchRecipes(completionHandler: { [weak self] response in
            switch response {
            case .success(response: let response):
                self?.recipesList = response
                self?.recipesListBackUp = response
                self?.presenter?.reloadCharacters()
            case .failure(error: let error):
                if let message = error?.message {
                    self?.presenter?.showToast(message: message, state: .critical)
                }
            case .notConnectedToInternet:
                self?.presenter?.showToast(message: HomeInteractorConstant.noInternetMessage.rawValue, state: .warning)
            }
        })
    }

    func searchRecipe(text: String) {
        if text.isEmpty {
            self.recipesList = self.recipesListBackUp
            self.presenter?.reloadCharacters()
            return
        }

        let filteredRecipes = recipesList?.recipes.filter({$0.recipeFilter.contains(text)}) ?? []

        self.recipesList?.recipes = filteredRecipes
        self.presenter?.reloadCharacters()
    }
}
