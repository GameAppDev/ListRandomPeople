//
//  ActivityIndicator.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import UIKit
import Lottie

@IBDesignable internal class ActivityIndicator: UIView {
    
    @IBOutlet private weak var indicatorAnimationView: LottieAnimationView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    class func instanceFromNib() -> UIView {
        guard let view = UINib(
            nibName: String(describing: Self.self),
            bundle: nil
        ).instantiate(withOwner: nil, options: nil)[safe: 0] as? UIView
        else { return UIView() }
        
        return view
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)

        setDefaultLoading()
    }

    public func setFrame(_ window: UIWindow) {
        self.frame = window.frame
        self.bounds = window.bounds
        self.layoutIfNeeded()
    }

    private func setDefaultLoading() {
        indicatorAnimationView.backgroundBehavior = .pauseAndRestore
        indicatorAnimationView.loopMode = .loop
        indicatorAnimationView.animation = LottieAnimation.named("indicator-animation-view")
        indicatorAnimationView.play()
    }
}
