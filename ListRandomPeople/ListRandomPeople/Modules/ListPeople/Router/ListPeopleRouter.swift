//
//  ListPeopleRouter.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import UIKit

final class ListPeopleRouter {
    
    public func returnVC() -> UIViewController {
        return ListPeopleBuilder.buildModule()
    }
}

extension ListPeopleRouter: IListPeoplePresenterToRouter { }
