//
//  HomeViewController.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit

protocol HomeDisplayLogic: AnyObject, BaseViewControllerLogic {
    func reloadCharacters()
}

class HomeViewController: BaseViewController, HomeDisplayLogic {

    var interactor: (HomeBusinessLogic & HomeDataStore)?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    private let searchController = UISearchController(searchResultsController: nil)
    let refreshControl = UIRefreshControl()
    // MARK: - Object lifecycle

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Setup

    private func setup() {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.viewId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        refreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        tableView.refreshControl = refreshControl
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        view.backgroundColor = .white
        title = "Recipes"
    }

    @objc func refreshTable() {
        interactor?.fetchCharacters()
        refreshControl.beginRefreshing()
    }

    private func setupUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func reloadCharacters() {
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.recipesList?.recipes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.viewId, for: indexPath)
        guard let cell = tableViewCell as? CharacterTableViewCell,
              let recipes = interactor?.recipesList?.recipes[indexPath.row]
        else {
            return UITableViewCell()
        }

        cell.setupCell(character: recipes)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let recipe = interactor?.recipesList?.recipes[indexPath.row]
        else {
            return
        }

        interactor?.selectedRecipe = recipe
        router?.navigateToRecipeDetail()
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        interactor?.searchRecipe(text: searchText)
    }
}
