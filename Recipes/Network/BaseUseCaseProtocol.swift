//
//  BaseUseCaseProtocol.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 5/1/23.
//

import Foundation

protocol BaseUseCaseProtocol {
    var repository: RemoteRepositoryProtocol { get }
}
