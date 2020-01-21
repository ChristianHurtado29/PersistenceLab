//
//  PicturesAPI.swift
//  PersistenceLab
//
//  Created by Christian Hurtado on 1/19/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import Foundation
import NetworkHelper

struct PicturesAPI {
    
    static func loadPictures(for searchQuery: String,
                              completion: @escaping (Result<[Pictures], AppError>) -> ()) {
            
        let apiKey = "14968421-bdbbdb0f044ae1bfcb38ea89d&q"
        
            let searchQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "yellow"
            
        let picturesEndpointURL = "https://pixabay.com/api/?key=\(apiKey)=\(searchQuery)&image_type=photo"
            
                guard let url = URL(string: picturesEndpointURL) else {
                completion(.failure(.badURL(picturesEndpointURL)))
                return
            }
            
            let request = URLRequest(url: url)
            
            NetworkHelper.shared.performDataTask(with: request) { (result) in
                switch result {
                case .failure(let appError):
                    completion(.failure(.networkClientError(appError)))
                case .success(let data):
                    do {
                        let searchResults = try JSONDecoder().decode(PicHits.self, from: data)
                        let picReturns = searchResults.hits
                        completion(.success(picReturns))
                    } catch {
                        completion(.failure(.decodingError(error)))
                    }
                }
            }
        }
    }


