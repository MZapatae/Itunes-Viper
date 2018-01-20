//
//  ArtistSearchContract.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit

protocol ArtistSearchView: class {
  var presenter: ArtistSearchPresentation! { get set }
  
}

protocol ArtistSearchPresentation: class {
  weak var view: ArtistSearchView? { get set }
  var interactor: ArtistSearchUsesCase! { get set }
  var router: ArtistSearchWireframe! { get set }
  
}

protocol ArtistSearchUsesCase: class {
  weak var output: ArtistSearchInteractorOutput! { get set }
  
}

protocol ArtistSearchInteractorOutput: class {
  
  
}

protocol ArtistSearchWireframe: class {
  weak var viewController: UIViewController? { get set }
  
  
  static func assembleModule() -> UIViewController
}

