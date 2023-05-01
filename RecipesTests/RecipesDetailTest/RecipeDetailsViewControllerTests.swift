//
//  RecipeDetailsViewControllerTests.swift
//  recipes
//
//  Copyright © 2022 Empowerment Labs. All rights reserved.
//

@testable import recipes
import XCTest

class RecipeDetailsViewControllerTests: XCTestCase {

    // MARK: - Subject under test
    var sut: RecipeDetailsViewController!
    var window: UIWindow?
    var interactor: RecipeDetailsBusinessLogicSpy!
    var router: RecipeDetailsRouterSpy!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()
        window = .init()
        setupRecipeDetailsViewController()
    }

    override func tearDown() {
        window = nil
        sut = nil
        interactor = nil
        router = nil
        super.tearDown()
    }

    // MARK: - Test setup
    
    func setupRecipeDetailsViewController() {
        sut = RecipeDetailsViewController()
        interactor = .init()
        router = .init()
        sut?.interactor = interactor
        sut?.router = router
    }

    func loadView() {
        window?.addSubview(sut!.view)
        RunLoop.current.run(until: Date())
    }

    // MARK: - Tests
    func test_viewWillAppear() {
        sut.viewWillAppear(true)

        XCTAssertTrue(interactor.viewWillAppearCalled)
    }

    func test_setupView() {
        sut.setupView(
            recipe: Home.RecipesListResponse.RecipesResponse.init(
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
        )
        
        XCTAssertEqual(sut.recipeNameLabel.text, "name")
        XCTAssertEqual(sut.recipeDescriptionLabel.text, "description")
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()

        XCTAssertTrue(!sut.view.subviews.isEmpty)
    }
}
