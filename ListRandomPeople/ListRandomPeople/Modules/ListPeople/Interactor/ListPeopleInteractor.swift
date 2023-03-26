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
    private var nextNumber: String = "0"
}

extension ListPeopleInteractor: IListPeoplePresenterToInteractor {
    
    // MARK: Fetch
    func fetchData<T>(request: T) {
        DataSource.fetch(next: nextNumber) { [weak self] response, error in
            guard let self = self else { return }
            
            if let response = response {
                self.peopleList.append(contentsOf: response.people)
                self.nextNumber = response.next ?? "0"
                self.presenter?.setData(data: self.peopleList)
            } else if let error = error {
                self.presenter?.setError(error: error.errorDescription)
            } else {
                self.presenter?.setError(error: "Try Again...")
            }
        }
    }
    
    // MARK: Get
    func getPeopleList() -> [Person] {
        return peopleList
    }

    // MARK: Remove
    func removePeopleList() {
        peopleList.removeAll()
    }
}
