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
        interactor?.fetchData(request: "")
    }
    
    func viewWillAppear() {
        view?.setNavigationBar?(title: "Random People List")
    }
}

extension ListPeoplePresenter: IListPeopleInteractorToPresenter {
    
    func setData<T>(data: T) {
        view?.hideIndicatorView()
        view?.setTableView(isHidden: false)
        view?.reloadTableView()
    }
    
    func setError(error: String) {
        view?.hideIndicatorView()
        view?.setTableView(isHidden: true)
        view?.showAlert(
            title: "Warning",
            message: error
        )
    }
}

extension ListPeoplePresenter: IListPeopleConnectorToPresenter {
    
    func getPeopleList() -> [Person] {
        return interactor?.getPeopleList() ?? []
    }
    
    func handleDetail(index: Int) {
        if let peopleList = interactor?.getPeopleList(),
           let person = peopleList[safe: index] {
            debugPrint("<-- id: \(person.id) - fullname: \(person.fullName) -->")
        }
    }
}
