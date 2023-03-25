//
//  ActivityIndicatorManager.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import UIKit

final class ActivityIndicatorManager: NSObject {
    
    public static let shared = ActivityIndicatorManager()
    
    private var isShowing: Bool = false
    private var indicatorView: ActivityIndicator?
    private var animationDuration = 0.3
    
    private override init() {
        super.init()
    }
    
    public func showIndicator() {
        showIndicatorView()
    }

    public func hideIndicator() {
        hideIndicatorView()
    }
}

extension ActivityIndicatorManager {
    
    private func showIndicatorView() {
        guard !isShowing else { return }

        if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
            guard let loadingView = ActivityIndicator.instanceFromNib() as? ActivityIndicator
            else { return }

            loadingView.setFrame(window)

            window.addSubview(loadingView)
            self.indicatorView = loadingView

            UIView.animate(withDuration: animationDuration) {
                self.indicatorView?.alpha = 1.0
            }

            isShowing = true
        }
    }

    private func hideIndicatorView() {
        guard isShowing else { return }

        if let loadingView = self.indicatorView {
            loadingView.alpha = 0.0
            UIView.animate(withDuration: animationDuration, delay: 0.0, options: [], animations: {
                loadingView.alpha = 0.0
            }, completion: { (_: Bool) in
                loadingView.removeFromSuperview()
            })

            isShowing = false
        }
    }
}
