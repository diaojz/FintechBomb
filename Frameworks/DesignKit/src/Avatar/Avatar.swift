//
//  Spacing.swift
//  
//
//  Created by 刁爷 on 2022/3/11.
//

import UIKit

public extension UIImageView {
    /// 默认头像圆角大小为10个像素
    /// - Parameter cornerRadius: 圆角大小
    func asAvatar(cornerRadius: CGFloat = 10) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
    }
}
