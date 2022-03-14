//
//  AppRouter.swift
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/14.
//

import UIKit

final class AppRouter: AppRouting {
    static let shared: AppRouter = .init()

    private var navigaters: [String: Navigating] = [:]

    private init() {
    }

    func register(path: String, navigator: Navigating) {
        navigaters[path.lowercased()] = navigator
    }

    func route(to url: URL?, routingSource: RoutingSource?, using transitionType: TransitionType = .present) {
        guard let url = url, let sourceViewController = routingSource as? UIViewController ?? UIApplication.shared.keyWindow?.rootViewController else {
            return
        }

        let path = url.lastPathComponent.lowercased()
        guard let urlComponets = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return
        }

        let params: [String: String] = (urlComponets.queryItems ?? []).reduce(into: [:]) { params, queryItem in
            params[queryItem.name.lowercased()] = queryItem.value
        }

        navigaters[path]?.navigate(from: sourceViewController, using: transitionType, params: params)
    }
}
