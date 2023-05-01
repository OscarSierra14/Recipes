//
//  RecipeDetailsInteractor.swift
//  recipes
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit

protocol RecipeDetailsBusinessLogic {
    func viewWillAppear()
}

protocol RecipeDetailsDataStore {
    var recipe: Home.RecipesListResponse.RecipesResponse? { get set }
}

class RecipeDetailsInteractor: RecipeDetailsBusinessLogic, RecipeDetailsDataStore {

    // MARK: - Attributes

    var presenter: RecipeDetailsPresentationLogic?
    var recipe: Home.RecipesListResponse.RecipesResponse?

    // MARK: - RecipeDetailsDataStore

    init() {}

    // MARK: - RecipeDetailsBusinessLogic
    func viewWillAppear() {
        guard let recipe = self.recipe
        else {
            return
        }

        presenter?.setupView(recipe: recipe)
    }
}
