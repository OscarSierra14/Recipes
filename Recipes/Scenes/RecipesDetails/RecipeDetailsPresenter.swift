//
//  RecipeDetailsPresenter.swift
//  recipes
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit

protocol RecipeDetailsPresentationLogic {
    func setupView(recipe: Home.RecipesListResponse.RecipesResponse)
}

class RecipeDetailsPresenter: RecipeDetailsPresentationLogic {

    weak var viewController: RecipeDetailsDisplayLogic?

    // MARK: - RecipeDetailsPresentationLogic
    func setupView(recipe: Home.RecipesListResponse.RecipesResponse) {
        viewController?.setupView(recipe: recipe)
    }
}
