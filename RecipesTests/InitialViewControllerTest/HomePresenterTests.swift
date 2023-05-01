//
//  HomePresenterTests.swift
//  recipes
//
//  Copyright © 2022 Empowerment Labs. All rights reserved.
//

@testable import recipes
import XCTest

class HomePresenterTests: XCTestCase {

    // MARK: - Subject under test

    var sut: HomePresenter?
    var viewController: HomeDisplayLogicSpy?

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()
        setupHomePresenter()
    }

    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }

    // MARK: - Test setup

    func setupHomePresenter() {
        sut = .init()
        viewController = .init()
        sut?.viewController =  viewController
    }

    // MARK: - Tests
}
