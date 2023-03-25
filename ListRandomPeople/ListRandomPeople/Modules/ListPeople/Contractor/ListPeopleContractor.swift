//
//  ListPeopleContractor.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import Foundation

protocol IListPeoplePresenterToView: PresenterToView {
    func setupTableView()
    func setTableView(isHidden: Bool)
    func reloadTableView()
}

protocol IListPeopleViewToPresenter: ViewToPresenter { }

protocol IListPeoplePresenterToInteractor: PresenterToInteractor {
    func getPeopleList() -> [Person]
    func removePeopleList()
}

protocol IListPeopleInteractorToPresenter: InteractorToPresenter { }

protocol IListPeoplePresenterToRouter: PresenterToRouter { }

protocol IListPeopleConnectorToPresenter: ConnectorToPresenter {
    func getPeopleList() -> [Person]
    func getBusyStatus() -> Bool
    func handleDetail(index: Int)
    func handlePeopleList()
}
