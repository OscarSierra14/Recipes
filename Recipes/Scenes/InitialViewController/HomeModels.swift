//
//  HomeModels.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit

enum Home {
    
    // MARK: - Use cases
    struct RecipesListResponse: Codable {
        var recipes: [RecipesResponse]
        
        struct RecipesResponse: Codable {
            var recipeName: String
            var recipeFilter: String
            var recipeDescription: String
            var recipeImage: String
            var recipeCountry: String
            var recipeLocation: LocationResponse
            
            struct LocationResponse: Codable {
                var latitud: Double
                var longitud: Double
            }
        }
    }
}
