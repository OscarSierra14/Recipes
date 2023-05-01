//
//  BaseUseCase.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 5/1/23.
//

import Foundation

class BaseUseCase: BaseUseCaseProtocol {
    
    let repository: RemoteRepositoryProtocol
    
    public init(repository: RemoteRepositoryProtocol = RemoteRepository()) {
        self.repository = repository
    }
}
