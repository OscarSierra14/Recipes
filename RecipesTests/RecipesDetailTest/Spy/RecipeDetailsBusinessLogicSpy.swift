//
//  RecipeDetailsBusinessLogicSpy.swift
//  recipes
//
//  Copyright © 2022 Empowerment Labs. All rights reserved.
//

@testable import recipes

class RecipeDetailsBusinessLogicSpy: RecipeDetailsBusinessLogic {
    var viewWillAppearCalled = false
    func viewWillAppear() {
        viewWillAppearCalled = true
    }
}
