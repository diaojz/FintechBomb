//
//  RoutingSource.swift
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/14.
//

import Foundation
import UIKit

protocol RoutingSource: AnyObject {}

typealias RoutingSourceProvider = () -> RoutingSource?

extension UIViewController: RoutingSource {}
