//
//  ListPeopleBuilder.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import UIKit

struct ListPeopleBuilder {

    static func buildModule() -> UIViewController {
        let viewController = ListPeopleViewController()
        let interactor = ListPeopleInteractor()
        let router = ListPeopleRouter()
        let presenter = ListPeoplePresenter(view: viewController,
                                            interactor: interactor,
                                            router: router)
        let tableViewConnector = ListPeopleTableViewConnector(presenter: presenter)
        
        viewController.presenter = presenter
        viewController.tableViewConnector = tableViewConnector
        
        interactor.presenter = presenter
        
        return viewController
    }
}
