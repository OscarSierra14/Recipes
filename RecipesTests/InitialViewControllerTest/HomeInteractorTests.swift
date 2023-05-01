//
//  HomeInteractorTests.swift
//  recipes
//
//  Copyright © 2022 Empowerment Labs. All rights reserved.
//

@testable import recipes
import XCTest

class HomeInteractorTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: HomeInteractor!
    var presenter: HomePresentationLogicSpy!
    var worker: HomeWorkerSpy!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupHomeInteractor()
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        worker = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupHomeInteractor() {
        presenter = .init()
        sut = .init()
        sut?.presenter = presenter
        worker = .init()
        sut?.worker = worker
    }
    
    // MARK: - Tests
    func test_fetchCharacters() {
        sut.fetchCharacters()

        XCTAssertTrue(presenter.reloadCharactersCalled)
    }

    func test_searchRecipes() {
        let recipesList: Home.RecipesListResponse? = .init(
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
    
        sut.recipesList = recipesList
        sut.searchRecipe(text: "test")

        XCTAssertTrue(presenter.reloadCharactersCalled)
    }
}
