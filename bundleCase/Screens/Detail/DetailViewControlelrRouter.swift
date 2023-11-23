//
//  DetailViewControlelrRouter.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DetailViewControlelrRoutingLogic {
    func routeToSomeWhere()
}

class DetailViewControlelrRouter: NSObject, DetailViewControlelrRoutingLogic {
    weak var viewController: DetailViewControlelrViewController?

    // MARK: Routing Logic
    
    func routeToSomeWhere() {
        
    }
}
