//
//  Navigating.swift
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/14.
//

import Foundation
import UIKit

protocol Navigating {
    func navigate(from viewController: UIViewController,
                  using transitionType: TransitionType,
                  params: [String: String])
}

extension Navigating {
    func navigate(to destinationViewController: UIViewController,
                  from sourceViewController: UIViewController,
                  using transitionType: TransitionType) {
        switch transitionType {
        case .show:
            sourceViewController.show(destinationViewController, sender: nil)
        case .present:
            sourceViewController.present(destinationViewController, animated: true, completion: nil)
        case .custom:
            print("custom push a VC.")
        }
    }
}
