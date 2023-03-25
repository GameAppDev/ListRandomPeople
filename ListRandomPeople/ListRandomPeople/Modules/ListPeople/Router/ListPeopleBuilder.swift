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
        //TODO: add tableViewConnector
        
        viewController.presenter = presenter
        //TODO: vc.connector = connector
        
        interactor.presenter = presenter
        
        return viewController
    }
}
