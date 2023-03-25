//
//  ListPeopleInteractor.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import Foundation

final class ListPeopleInteractor {
    
    weak var presenter: IListPeopleInteractorToPresenter?
    
    private var peopleList: [Person] = []
}

extension ListPeopleInteractor: IListPeoplePresenterToInteractor {
    
    // MARK: Fetch
    func fetchData<T>(request: T) { }
    
    // MARK: Get
    func getPeopleList() -> [Person] {
        return peopleList
    }
}
