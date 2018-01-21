//
//  Endpoint.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import ObjectMapper

typealias Parameters = [String : Any]
typealias Path = String

enum Method {
  case get, post, put, patch, delete
}

final class Endpoint<ResponseModel> {
  let method: Method
  let path: Path
  let parameters: Parameters?
  let decode: (String) -> ResponseModel?
  
  init (method: Method, path: Path, parameters: Parameters? = nil, decode: @escaping (String) -> ResponseModel?) {
    self.method = method
    self.path = path
    self.parameters = parameters
    self.decode = decode
  }
}

extension Endpoint where ResponseModel: Mappable {
  convenience init(method: Method, path: Path, parameters: Parameters? = nil) {
    self.init(method: method, path: path, parameters: parameters, decode: {
      guard let responseModel = Mapper<ResponseModel>().map(JSONString: $0) else {
        return nil
      }
      return responseModel
    })
  }
}

extension Endpoint where ResponseModel == Void {
  convenience init(method: Method, path: Path, parameters: Parameters? = nil) {
    self.init(method: method, path: path, parameters: parameters, decode: { _ in () })
  }
}

