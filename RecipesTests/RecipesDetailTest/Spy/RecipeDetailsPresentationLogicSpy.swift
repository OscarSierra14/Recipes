//
//  RecipeDetailsPresentationLogicSpy.swift
//  recipes
//
//  Copyright © 2022 Empowerment Labs. All rights reserved.
//

@testable import recipes

class RecipeDetailsPresentationLogicSpy: RecipeDetailsPresentationLogic {
    var setupViewCalled = false
    func setupView(recipe: recipes.Home.RecipesListResponse.RecipesResponse) {
        setupViewCalled = true
    }
}
