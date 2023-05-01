//
//  RecipeDetailsPresenterTests.swift
//  recipes
//
//  Copyright © 2022 Empowerment Labs. All rights reserved.
//

@testable import recipes
import XCTest

class RecipeDetailsPresenterTests: XCTestCase {

    // MARK: - Subject under test

    var sut: RecipeDetailsPresenter!
    var viewController: RecipeDetailsDisplayLogicSpy!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()
        setupRecipeDetailsPresenter()
    }

    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }

    // MARK: - Test setup

    func setupRecipeDetailsPresenter() {
        sut = .init()
        viewController = .init()
        sut?.viewController =  viewController
    }

    // MARK: - Tests
    func test_setupView() {
        let recipe = Home.RecipesListResponse.RecipesResponse.init(
            recipeName: "name",
            recipeFilter: "",
            recipeDescription: "description",
            recipeImage: "https://www.viveamarillo.com/sites/default/files/2020-05/cazuela-frijoles.jpg",
            recipeCountry: "",
            recipeLocation: .init(
                latitud: 0.0,
                longitud: 0.0
            )
        )
        sut.setupView(recipe: recipe)

        XCTAssertTrue(viewController.setupViewCalled)
    }
}
