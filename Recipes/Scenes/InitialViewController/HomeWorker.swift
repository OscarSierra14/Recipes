//
//  HomeWorker.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit
import Alamofire

protocol HomeWorkerProtocol {
    func fetchRecipes(completionHandler: @escaping (ServiceResponse<Home.RecipesListResponse?>) -> Void)
}


class HomeWorker: BaseUseCase, HomeWorkerProtocol {
    func fetchRecipes(completionHandler: @escaping (ServiceResponse<Home.RecipesListResponse?>) -> Void) {
        let endPoint = DataConstants.Endpoints.recepis

        repository.request(
            endpoint: endPoint,
            method: .get,
            requestBody: nil,
            completionHandler: completionHandler
        )
    }
}
