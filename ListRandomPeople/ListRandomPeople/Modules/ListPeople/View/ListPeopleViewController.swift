//
//  ListPeopleViewController.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import UIKit

final class ListPeopleViewController: BaseViewController {

    // MARK: Outlets
    @IBOutlet private weak var listTableView: UITableView!
    
    var presenter: IListPeopleViewToPresenter?
    var tableViewConnector: ListPeopleTableViewConnector?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear?()
    }
}

extension ListPeopleViewController: IListPeoplePresenterToView {
    
    func setupTableView() {
        listTableView.backgroundColor = UIColor.clear
        listTableView.contentInset = UIEdgeInsets(top: CGFloat(15).ws,
                                                  left: CGFloat(0),
                                                  bottom: CGFloat(15).ws,
                                                  right: CGFloat(0))
        listTableView.dataSource = tableViewConnector
        listTableView.delegate = tableViewConnector
        listTableView.separatorStyle = .none
        listTableView.registerCell(ListTableViewCell.self)
    }
    
    func setTableView(isHidden: Bool) {
        listTableView.isHidden = isHidden
    }
    
    func reloadTableView() {
        listTableView.reloadData()
    }
    
    func setNavigationBar(title: String) {
        setNavigationBarItems(title: title)
    }
}
