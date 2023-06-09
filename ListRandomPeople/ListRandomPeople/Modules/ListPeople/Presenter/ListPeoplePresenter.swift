//
//  ListPeoplePresenter.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import Foundation

final class ListPeoplePresenter {
    
    private weak var view: IListPeoplePresenterToView?
    private var interactor: IListPeoplePresenterToInteractor?
    private var router: IListPeoplePresenterToRouter?
    
    private var isBusy: Bool = true
    
    init(view: IListPeoplePresenterToView,
         interactor: IListPeoplePresenterToInteractor,
         router: IListPeoplePresenterToRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ListPeoplePresenter: IListPeopleViewToPresenter {
    
    func viewDidLoad() {
        view?.setupTableView()
        view?.setTableView(isHidden: true)
        
        view?.showIndicatorView()
        isBusy = true
        interactor?.fetchData(request: "")
    }
    
    func viewWillAppear() {
        view?.setNavigationBar?(title: "Random People List")
    }
    
    func handleRefreshData() {
        interactor?.removePeopleList()
        view?.showIndicatorView()
        isBusy = true
        interactor?.fetchData(request: "")
    }
}

extension ListPeoplePresenter: IListPeopleInteractorToPresenter {
    
    func setData<T>(data: T) {
        isBusy = false
        
        view?.setTableView(isHidden: false)
        view?.endTableViewRefreshControl()
        view?.reloadTableView()
        view?.hideIndicatorView()
    }
    
    func setError(error: String) {
        isBusy = false
        
        interactor?.removePeopleList()
        view?.setTableView(isHidden: false)
        view?.endTableViewRefreshControl()
        view?.showAlert(
            title: "Warning",
            message: error
        )
        view?.hideIndicatorView()
    }
}

extension ListPeoplePresenter: IListPeopleConnectorToPresenter {
    
    func getPeopleList() -> [Person] {
        return interactor?.getPeopleList() ?? []
    }
    
    func getBusyStatus() -> Bool {
        return isBusy
    }
    
    func handlePeopleList() {
        view?.showIndicatorView()
        isBusy = true
        interactor?.fetchData(request: "")
    }
    
    func handleDetail(index: Int) {
        if let peopleList = interactor?.getPeopleList(),
           let person = peopleList[safe: index] {
            debugPrint("<-- id: \(person.id) - fullname: \(person.fullName) -->")
        }
    }
}
