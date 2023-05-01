//
//  RecipeDetailsInteractorTests.swift
//  recipes
//
//  Copyright © 2022 Empowerment Labs. All rights reserved.
//

@testable import recipes
import XCTest

class RecipeDetailsInteractorTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: RecipeDetailsInteractor!
    var presenter: RecipeDetailsPresentationLogicSpy!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupRecipeDetailsInteractor()
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupRecipeDetailsInteractor() {
        presenter = .init()
        sut = .init()
        sut?.presenter = presenter
    }
    
    // MARK: - Tests
    func test_viewWillAppear() {
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

        sut.recipe = recipe
        sut.viewWillAppear()

        XCTAssertTrue(presenter.setupViewCalled)
    }
}
