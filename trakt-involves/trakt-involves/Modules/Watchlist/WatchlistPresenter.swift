//
//  WatchlistPresenter.swift
//  trakt-involves
//
//  Created by iMac on 26/07/17.
//  Copyright © 2017 Flavio Kruger Bittencourt. All rights reserved.
//

class WatchlistPresenter: WatchlistPresenterInputProtocol {

    weak var presenterOutput: WatchlistPresenterOutputProtocol?
    var interactor: WatchlistInteractorInputProtocol?
    var router: WatchlistRouterProtocol?

    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
    
}

extension WatchlistPresenter: WatchlistInteractorOutputProtocol {
    
}
