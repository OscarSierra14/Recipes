//
//  RecipeMapViewController.swift
//  recipes
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit
import MapKit

protocol RecipeMapDisplayLogic: AnyObject, BaseViewControllerLogic {
    func setupMap(latitud: Double, longitud: Double)
}

class RecipeMapViewController: BaseViewController, RecipeMapDisplayLogic {

    var interactor: RecipeMapBusinessLogic?
    var router: (NSObjectProtocol & RecipeMapRoutingLogic & RecipeMapDataPassing)?

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
        let interactor = RecipeMapInteractor()
        let presenter = RecipeMapPresenter()
        let router = RecipeMapRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.viewWillAppear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setupMap(latitud: Double, longitud: Double) {
        // Crear un mapa
        let mapa = MKMapView(frame: view.bounds)
        view.addSubview(mapa)
        
        // Crear un pin en la ubicación dada por la latitud y longitud
        let ubicacion = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        let pin = MKPointAnnotation()
        pin.coordinate = ubicacion
        mapa.addAnnotation(pin)
        
        // Zoom en el pin
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: ubicacion, span: span)
        mapa.setRegion(region, animated: true)
    }
}
