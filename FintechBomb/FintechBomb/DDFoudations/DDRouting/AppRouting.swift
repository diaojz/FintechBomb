//
//  AppRouting.swift
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/14.
//

import Foundation
import UIKit

protocol AppRouting {
    func register(path: String, navigator: Navigating)
    func route(to url: URL?, routingSource: RoutingSource?, using transitionType: TransitionType)
}
