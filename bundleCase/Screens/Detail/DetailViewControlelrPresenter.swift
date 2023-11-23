//
//  DetailViewControlelrPresenter.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DetailViewControlelrPresentationLogic {
    func present(response: DetailViewControlelr.Something.Response)
}

class DetailViewControlelrPresenter: DetailViewControlelrPresentationLogic {
    weak var viewController: DetailViewControlelrDisplayLogic?

    // MARK: Presentation Logic
    
    func present(response: DetailViewControlelr.Something.Response) {
        let viewModel = DetailViewControlelr.Something.ViewModel()
        viewController?.display(viewModel: viewModel)
    }
}
