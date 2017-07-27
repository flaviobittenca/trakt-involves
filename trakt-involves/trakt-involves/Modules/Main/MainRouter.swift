//
//  HomeRouter.swift
//  trakt-involves
//
//  Created by iMac on 26/07/17.
//  Copyright © 2017 Flavio Kruger Bittencourt. All rights reserved.
//

import UIKit

class MainRouter: MainRouterProtocol {
    weak var view: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let tabBarController = MainTabBarController()
        let router = MainRouter()
        let presenter = MainPresenter(router: router)
        let interactor = MainInteractor()
        
        tabBarController.presenter = presenter
        router.view = tabBarController
        
        presenter.presenterOutput = tabBarController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.interactorOutput = presenter
        
        let myTvSeriesViewController = WatchlistRouter.assembleModule()
        myTvSeriesViewController.tabBarItem = UITabBarItem(title: "Upcoming", image: nil, selectedImage: nil)
        
        let myTvSeriesViewController2 = WatchlistRouter.assembleModule()
        myTvSeriesViewController2.tabBarItem = UITabBarItem(title: "Watchlist", image: nil, selectedImage: nil)
        
        let myTvSeriesViewController3 = WatchlistRouter.assembleModule()
        myTvSeriesViewController3.tabBarItem = UITabBarItem(title: "Profile", image: nil, selectedImage: nil)
        
        tabBarController.viewControllers = [
            myTvSeriesViewController,
            myTvSeriesViewController2,
            myTvSeriesViewController3]
        
        return tabBarController
    }
    
}
