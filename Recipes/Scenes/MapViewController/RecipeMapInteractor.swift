//
//  RecipeMapInteractor.swift
//  recipes
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit

protocol RecipeMapBusinessLogic {
    func viewWillAppear()
}

protocol RecipeMapDataStore {
    var latitud: Double? { get set }
    var longitud: Double? { get set }
}

class RecipeMapInteractor: RecipeMapBusinessLogic, RecipeMapDataStore {
    var latitud: Double?
    var longitud: Double?
    

    // MARK: - Attributes

    var presenter: RecipeMapPresentationLogic?

    // MARK: - RecipeMapDataStore

    init() {}

    // MARK: - RecipeMapBusinessLogic
    func viewWillAppear() {
        guard let latitud = self.latitud,
              let longitud = self.longitud
        else {
            return
        }

        presenter?.setupMap(latitud: latitud, longitud: longitud)
    }
}
