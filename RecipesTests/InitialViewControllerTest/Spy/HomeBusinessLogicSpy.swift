//
//  HomeBusinessLogicSpy.swift
//  recipes
//
//  Copyright © 2022 Empowerment Labs. All rights reserved.
//

@testable import recipes

class HomeBusinessLogicSpy: HomeBusinessLogic, HomeDataStore {
    var selectedRecipe: Home.RecipesListResponse.RecipesResponse? = .init(
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

    var recipesList: Home.RecipesListResponse? = .init(
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

    var recipesListBackUp: Home.RecipesListResponse? = .init(
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
    
    var viewDidLoadCalled = false
    func viewDidLoad() {
        viewDidLoadCalled = true
    }
    
    var fetchCharactersCalled = false
    func fetchCharacters() {
        fetchCharactersCalled = true
    }
    
    var searchRecipeCalled = false
    func searchRecipe(text: String) {
        searchRecipeCalled = true
    }
}
