//
//  Contractable.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import UIKit

// MARK: - PresenterToView
@objc protocol PresenterToView: AnyObject {
    func showIndicatorView()
    func hideIndicatorView()
    func showAlert(title: String, message: String)
    @objc optional func setNavigationBar(title: String)
}

extension UIViewController: PresenterToView {
    
    func showIndicatorView() {
        ActivityIndicatorManager.shared.showIndicator()
    }
    
    func hideIndicatorView() {
        ActivityIndicatorManager.shared.hideIndicator()
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alertController.addAction(.init(
            title: "OK",
            style: .cancel,
            handler: nil
        ))
        self.navigationController?.present(
            alertController,
            animated: true,
            completion: nil
        )
    }
}

// MARK: - ViewToPresenter
@objc protocol ViewToPresenter: AnyObject {
    func viewDidLoad()
    @objc optional func viewWillAppear()
    @objc optional func viewDidAppear()
    @objc optional func viewWillDisappear()
    @objc optional func viewDidDisappear()
}

// MARK: - PresenterToInteractor
protocol PresenterToInteractor: AnyObject {
    func fetchData<T>(request: T)
}

// MARK: - InteractorToPresenter
protocol InteractorToPresenter: AnyObject {
    func setData<T>(data: T)
    func setError(error: String)
}

// MARK: - PresenterToRouter
@objc protocol PresenterToRouter: AnyObject { }

// MARK: - ConnectorToPresenter
@objc protocol ConnectorToPresenter: AnyObject { }
