//
//  RecipeMapPresenter.swift
//  recipes
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit

protocol RecipeMapPresentationLogic {
    func setupMap(latitud: Double, longitud: Double)
}

class RecipeMapPresenter: RecipeMapPresentationLogic {

    weak var viewController: RecipeMapDisplayLogic?

    // MARK: - RecipeMapPresentationLogic
    func setupMap(latitud: Double, longitud: Double) {
        viewController?.setupMap(latitud: latitud, longitud: longitud)
    }
}
