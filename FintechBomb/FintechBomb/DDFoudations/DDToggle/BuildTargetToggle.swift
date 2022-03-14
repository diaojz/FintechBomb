//
//  BuildTargetToggleDataStore.swift
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/14.
//

import Foundation

enum BuildTargetToggle: ToggleType {
    case debug,
    uat,
    production
}

struct BuildTargetToggleDataStore: ToggleDataStoreType {
    static let shared: BuildTargetToggleDataStore = .init()

    private let buildTarget: BuildTargetToggle

    private init() {
        #if DEBUG
        buildTarget = .debug
        #endif

        #if UAT
        buildTarget = .uat
        #endif

        #if production
        buildTarget = .production
        #endif
    }

    func isToggleOn(_ toggle: ToggleType) -> Bool {
        guard let toggle = toggle as? BuildTargetToggle else {
            return false
        }

        return toggle == buildTarget
    }

    func update(toggle: ToggleType, value: Bool) {
        print("不会执行,因为不会在运行时把编译期间的内容修改了.")
    }
}
