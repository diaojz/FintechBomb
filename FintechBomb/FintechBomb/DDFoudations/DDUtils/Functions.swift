//
//  Functions.swift
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/14.
//

import UIKit

func configure<T: AnyObject>(_ object: T, closure: (T) -> Void) -> T {
    closure(object)
    return object
}
