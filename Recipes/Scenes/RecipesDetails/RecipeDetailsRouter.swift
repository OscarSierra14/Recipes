//
//  RecipeDetailsRouter.swift
//  recipes
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit

@objc protocol RecipeDetailsRoutingLogic {
    func navigateToMap()
}

protocol RecipeDetailsDataPassing {
    var dataStore: RecipeDetailsDataStore? { get }
}

class RecipeDetailsRouter: NSObject, RecipeDetailsRoutingLogic, RecipeDetailsDataPassing {

    weak var viewController: RecipeDetailsViewController?
    var dataStore: RecipeDetailsDataStore?

    func navigateToMap() {
        let mapVC = RecipeMapViewController()
        if var destination = mapVC.router?.dataStore {
            passDataToRecipeDetailVC(origin: dataStore, destination: &destination)
        }
        viewController?.navigationController?.navigationBar.tintColor = .black
        viewController?.navigationController?.pushViewController(mapVC, animated: true)
    }

    func passDataToRecipeDetailVC(
        origin: RecipeDetailsDataStore?,
        destination: inout RecipeMapDataStore
    ) {
        destination.latitud = origin?.recipe?.recipeLocation.latitud
        destination.longitud = origin?.recipe?.recipeLocation.longitud
    }
}
