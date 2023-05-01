//
//  RecipeDetailsViewController.swift
//  recipes
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit

protocol RecipeDetailsDisplayLogic: AnyObject, BaseViewControllerLogic {
    func setupView(recipe: Home.RecipesListResponse.RecipesResponse)
}

class RecipeDetailsViewController: BaseViewController, RecipeDetailsDisplayLogic {
    var interactor: RecipeDetailsBusinessLogic?
    var router: (NSObjectProtocol & RecipeDetailsRoutingLogic & RecipeDetailsDataPassing)?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    lazy var recipeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var recipeNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: UIFont.nameOf.Georgia_Bold.rawValue, size: 20.0)
        return label
    }()

    lazy var recipeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: UIFont.nameOf.Georgia.rawValue, size: 15.0)
        return label
    }()

    lazy var recipeLocationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("Go to Location", for: .normal)
        button.addRoundCorner()
        button.addTarget(self, action: #selector(mapButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: UIFont.nameOf.Georgia_Bold.rawValue, size: 15.0)
        return button
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        let viewController = self
        let interactor = RecipeDetailsInteractor()
        let presenter = RecipeDetailsPresenter()
        let router = RecipeDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        interactor?.viewWillAppear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.backgroundColor = .white
        contentView.addSubview(recipeImage)
        contentView.addSubview(recipeNameLabel)
        contentView.addSubview(recipeDescriptionLabel)
        contentView.addSubview(recipeLocationButton)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),

            recipeImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            recipeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recipeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recipeImage.heightAnchor.constraint(equalToConstant: view.frame.height * 0.5),
            
            recipeNameLabel.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 16.0),
            recipeNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            recipeNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),

            recipeDescriptionLabel.topAnchor.constraint(equalTo: recipeNameLabel.bottomAnchor, constant: 16.0),
            recipeDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            recipeDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),

            recipeLocationButton.topAnchor.constraint(equalTo: recipeDescriptionLabel.bottomAnchor, constant: 16.0),
            recipeLocationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            recipeLocationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            recipeLocationButton.heightAnchor.constraint(equalToConstant: 46.0),
            recipeLocationButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16.0)
        ])
    }

    func setupView(recipe: Home.RecipesListResponse.RecipesResponse) {
        guard let urlImage = URL(string: recipe.recipeImage)
        else {
            return
        }

        recipeNameLabel.text = recipe.recipeName
        recipeDescriptionLabel.text = recipe.recipeDescription
        recipeImage.sd_setImage(
            with: urlImage,
            placeholderImage: UIImage(named: "placeHolderImage")
        )
    }

    @objc private func mapButtonAction() {
        router?.navigateToMap()
    }
}
