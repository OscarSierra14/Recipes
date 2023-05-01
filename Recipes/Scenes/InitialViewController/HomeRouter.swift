//
//  HomeRouter.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit

@objc protocol HomeRoutingLogic {
    func navigateToRecipeDetail()
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {

    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?

    func navigateToRecipeDetail() {
        let recipeDetailVC = RecipeDetailsViewController()
        if var destination = recipeDetailVC.router?.dataStore {
            passDataToRecipeDetailVC(origin: dataStore, destination: &destination)
        }
        viewController?.navigationController?.navigationBar.tintColor = .black
        viewController?.navigationController?.pushViewController(recipeDetailVC, animated: true)
    }

    func passDataToRecipeDetailVC(
        origin: HomeDataStore?,
        destination: inout RecipeDetailsDataStore
    ) {
        destination.recipe = origin?.selectedRecipe
    }
}
