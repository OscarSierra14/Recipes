//
//  HomeWorkerSpy.swift
//  recipes
//
//  Copyright © 2022 Empowerment Labs. All rights reserved.
//

@testable import recipes

class HomeWorkerSpy: HomeWorkerProtocol {
    var fetchRecipesCalled = false
    func fetchRecipes(completionHandler: @escaping (ServiceResponse<Home.RecipesListResponse?>) -> Void) {
        fetchRecipesCalled = true
        completionHandler(
            .success(
                response: Home.RecipesListResponse.init(
                    recipes: [
                        Home.RecipesListResponse.RecipesResponse.init(
                            recipeName: "name test",
                            recipeFilter: "filter test",
                            recipeDescription: "description test",
                            recipeImage: "https://www.viveamarillo.com/sites/default/files/2020-05/cazuela-frijoles.jpg",
                            recipeCountry: "Country test",
                            recipeLocation: .init(
                                latitud: 10.4001987,
                                longitud: -75.5085254
                            )
                        )
                    ]
                )
            )
        )
    }
}
