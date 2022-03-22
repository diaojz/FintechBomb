//
//  DDLocalToggleDataStore.swift
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/14.
//

import Foundation

enum LocalToggle: String, ToggleType {
    case isLikeButtonEnabled
}

struct LocalToggleDataStore: ToggleDataStoreType {
    private let userDefaults: UserDefaults

    private init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
        self.userDefaults.register(defaults: [LocalToggle.isLikeButtonEnabled.rawValue: false])
    }

    static let shared: LocalToggleDataStore = .init(userDefaults: .standard)

    func isToggleOn(_ toggle: ToggleType) -> Bool {
        guard let toggle = toggle as? LocalToggle else {
            return false
        }

        return userDefaults.bool(forKey: toggle.rawValue)
    }

    func update(toggle: ToggleType, value: Bool) {
        guard let toggle = toggle as? LocalToggle else {
            return
        }

        userDefaults.set(value, forKey: toggle.rawValue)
    }
}
