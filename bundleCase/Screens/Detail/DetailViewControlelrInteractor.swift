//
//  DetailViewControlelrInteractor.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DetailViewControlelrBusinessLogic {
    func handle(request: DetailViewControlelr.Something.Request)
}

class DetailViewControlelrInteractor: DetailViewControlelrBusinessLogic {
    var presenter: DetailViewControlelrPresentationLogic?
    
    // MARK: Business Logic

    func handle(request: DetailViewControlelr.Something.Request) {
        let response = DetailViewControlelr.Something.Response()
        presenter?.present(response: response)
    }
}
