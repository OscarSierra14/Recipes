//
//  HomeViewControllerTests.swift
//  recipes
//
//  Copyright © 2022 Empowerment Labs. All rights reserved.
//

@testable import recipes
import XCTest

class HomeViewControllerTests: XCTestCase {

    // MARK: - Subject under test
    var sut: HomeViewController!
    var window: UIWindow?
    var interactor: HomeBusinessLogicSpy!
    var router: HomeRouterSpy!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()
        window = .init()
        setupHomeViewController()
    }

    override func tearDown() {
        window = nil
        sut = nil
        interactor = nil
        router = nil
        super.tearDown()
    }

    // MARK: - Test setup
    
    func setupHomeViewController() {
        sut = HomeViewController()
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
    func test_viewDidLoad() {
        sut?.viewDidLoad()

        XCTAssertTrue(interactor.viewDidLoadCalled)
    }

    func test_refreshTableView() {
        sut.refreshTable()

        XCTAssertTrue(interactor.fetchCharactersCalled)
    }
}
