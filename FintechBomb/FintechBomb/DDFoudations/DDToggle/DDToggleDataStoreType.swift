//
//  DDToggleDataStoreType.swift
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/13.
//

import Foundation

protocol ToggleType {
}

protocol ToggleDataStoreType {
    func isToggleOn(_ toggle: ToggleType) -> Bool
    func update(toggle: ToggleType, value: Bool)
}
