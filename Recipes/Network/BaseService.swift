//
//  BaseService.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 5/1/23.
//

import Foundation
import Alamofire

class BaseService: ServiceProtocol {
    
    let sessionManager: Session
    
    public init(configuration: URLSessionConfiguration = URLSessionConfiguration.af.default) {
        sessionManager = Session(configuration: configuration)
    }
    
    func request<T: Codable>(_ url: URLConvertible,
                             of type: T.Type,
                             method: HTTPMethod = .get,
                             parameters: [String: Any]? = [:],
                             headers: [String: String]? = [:],
                             completionHandler: @escaping (ServiceResponse<T>) -> Void) {
        
        let baseHeaders: [String: String] = headers ?? [:]
        var requestHeaders: HTTPHeaders?

        requestHeaders = HTTPHeaders(baseHeaders)

        let request = sessionManager.request(url,
                                             method: method,
                                             parameters: parameters,
                                             encoding: method == .get ? URLEncoding.default : JSONEncoding.default,
                                             headers: requestHeaders)
        responseMapping(from: request, completionHandler: completionHandler)
    }
    
    func responseMapping<T: Codable>(from dataRequest: DataRequest,
                                     completionHandler: @escaping (ServiceResponse<T>) -> Void) {
        dataRequest.responseDecodable(of: T.self) { [weak self] (serviceResponse) in
            guard let response = serviceResponse.value else {
                if let error = serviceResponse.error as NSError?,
                   let afError = serviceResponse.error,
                   (error.code == NSURLErrorNotConnectedToInternet || afError.isSessionTaskError) {
                    completionHandler(.notConnectedToInternet)
                } else {
                    print(serviceResponse.error as Any)
                    guard let data = serviceResponse.data, let errorResponse = self?.handlerErrorResponse(data: data) else {
                        completionHandler(.failure(error: nil))
                        return
                    }
                    completionHandler(.failure(error: errorResponse))
                }
                return
            }
            completionHandler(.success(response: response))
        }
    }
    
    private func handlerErrorResponse(data: Data) -> ErrorResponse? {
        showError(data: data)
        let decoder = JSONDecoder()
        guard let errorResponse = try? decoder.decode(ErrorResponse.self, from: data) else { return nil }
        return errorResponse
    }
    
    private func showError(data: Data?) {
        guard let data = data else { return }
        let json = String(data: data, encoding: String.Encoding.utf8)
        print("Failure Response: \(json ?? String())")
    }
    
    func cancelAllRequest() {
        sessionManager.cancelAllRequests()
    }
}
