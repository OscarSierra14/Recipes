//
//  RecipeMapRouter.swift
//  recipes
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit

@objc protocol RecipeMapRoutingLogic {
}

protocol RecipeMapDataPassing {
    var dataStore: RecipeMapDataStore? { get }
}

class RecipeMapRouter: NSObject, RecipeMapRoutingLogic, RecipeMapDataPassing {

    weak var viewController: RecipeMapViewController?
    var dataStore: RecipeMapDataStore?

}
