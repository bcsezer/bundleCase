//
//  HomeViewControllerRouter.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeViewControllerRoutingLogic {
    func routeToSomeWhere()
}

class HomeViewControllerRouter: NSObject, HomeViewControllerRoutingLogic {
    weak var viewController: HomeViewControllerViewController?

    // MARK: Routing Logic
    
    func routeToSomeWhere() {
        
    }
}
