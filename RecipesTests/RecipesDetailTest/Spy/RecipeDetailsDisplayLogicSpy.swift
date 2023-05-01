//
//  RecipeDetailsDisplayLogicSpy.swift
//  recipes
//
//  Copyright © 2022 Empowerment Labs. All rights reserved.
//

@testable import recipes

class RecipeDetailsDisplayLogicSpy: RecipeDetailsDisplayLogic {
    var setupViewCalled = false
    func setupView(recipe: recipes.Home.RecipesListResponse.RecipesResponse) {
        setupViewCalled = true
    }
    
    var showToastCalled = false
    func showToast(message: String, state: recipes.ToastState) {
        showToastCalled = true
    }
}
