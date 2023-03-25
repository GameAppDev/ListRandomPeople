//
//  ListPeopleTableViewConnector.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import UIKit

final class ListPeopleTableViewConnector: NSObject {
    
    private let presenter: IListPeopleConnectorToPresenter?
    
    init(presenter: IListPeopleConnectorToPresenter) {
        self.presenter = presenter
    }
}

extension ListPeopleTableViewConnector: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Count
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getPeopleList().count ?? 0
    }
    
    // MARK: - Cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.className,
                                                       for: indexPath) as? ListTableViewCell
        else { return UITableViewCell() }

        if let peopleList = presenter?.getPeopleList(),
           let person = peopleList[safe: indexPath.row] {
            cell.configureCell(person: person)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.handleDetail(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let isBusy = presenter?.getBusyStatus(), !isBusy && (presenter?.getPeopleList().count == indexPath.row + 1) {
            presenter?.handlePeopleList()
        }
    }
}
