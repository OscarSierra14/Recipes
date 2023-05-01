//
//  HomeDisplayLogicSpy.swift
//  recipes
//
//  Copyright © 2022 Empowerment Labs. All rights reserved.
//

@testable import recipes

class HomeDisplayLogicSpy: HomeDisplayLogic {
    var reloadCharactersCalled = false
    func reloadCharacters() {
        reloadCharactersCalled = true
    }
    
    var showToastCalled = false
    func showToast(message: String, state: recipes.ToastState) {
        showToastCalled = true
    }
}
