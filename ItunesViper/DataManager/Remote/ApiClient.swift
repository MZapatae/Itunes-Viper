//
//  ApiClient.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import Alamofire
import ObjectMapper

protocol ApiClientProtocol {
  func request<ResponseModel>(_ endpoint: Endpoint<ResponseModel>,
                              onSuccess: @escaping (_ response: ResponseModel) -> (),
                              onError: @escaping (_ error: Error) -> ())
}

final class ApiClient: ApiClientProtocol {
  static let sharedInstance = ApiClient()
  private let sessionManager: Alamofire.SessionManager
  
  private init() {
    let sessionConfiguration = URLSessionConfiguration.default
    sessionConfiguration.timeoutIntervalForRequest = 30
    self.sessionManager = Alamofire.SessionManager(configuration: sessionConfiguration)
  }
  
  func request<ResponseModel>(_ endpoint: Endpoint<ResponseModel>,
                              onSuccess: @escaping (ResponseModel) -> (),
                              onError: @escaping (Error) -> ()) {
    
    let request = sessionManager.request(
      url(path: endpoint.path),
      method: self.httpMethod(from: endpoint.method),
      parameters: endpoint.parameters)
    
    request
      .validate(statusCode: 200...299)
      .validate(contentType: ["application/json"])
      .responseString(completionHandler: { (response) in
        debugPrint(response)
        switch response.result {
          
        case .success(let responseValue):
          if let endpointDecoded = endpoint.decode(responseValue) {
            onSuccess(endpointDecoded)
            print("Request Success!")
          } else {
            let userInfo: [String : Any] = [NSLocalizedDescriptionKey :  NSLocalizedString("Error", value: "JSON Invalido", comment: "")]
            let decodedError = NSError(domain:"JsonDecodeError", code:601, userInfo:userInfo)
            onError(decodedError)
            print("Request Success!... but JSON Response not valid")
          }
          
        case .failure(let errorValue):
          onError(errorValue)
          print("Request Error!")
        }
      })
  }
  
  private func url(path: Path) -> URL {
    let baseUrl = URL(string: AppConstants.apiUrl)!
    return baseUrl.appendingPathComponent(path)
  }
  
  private func httpMethod(from method: Method) -> Alamofire.HTTPMethod {
    switch method {
    case .get: return .get
    case .post: return .post
    case .put: return .put
    case .patch: return .patch
    case .delete: return .delete
    }
  }
}
