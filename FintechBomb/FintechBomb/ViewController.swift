//
//  ViewController.swift
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/11.
//

import UIKit
import DesignKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let testButton = UIButton(frame: CGRect(x: 20, y: 500, width: 200, height: 40))
        testButton.tintColor = UIColor.designKit.primary
        testButton.backgroundColor = UIColor.orange
        testButton.setTitle("进入测试VC", for: .normal)
        testButton.addTarget(self, action: #selector(testButtonClicked), for: .touchUpInside)
        view.addSubview(testButton)

        self.view.backgroundColor = UIColor.designKit.background

        let avatarImageView: UIImageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        avatarImageView.asAvatar(cornerRadius: 20)
        avatarImageView.backgroundColor = .systemPink
        self.view.addSubview(avatarImageView)

        let titleLabel = UILabel(frame: CGRect(x: 100, y: 220, width: 300, height: 50))
        titleLabel.text = "玩命写代码..."
        titleLabel.textColor = UIColor.designKit.primaryText
        self.view.addSubview(titleLabel)
    }

    @objc func testButtonClicked() {
        let testVC = DDTestViewController()
        navigationController?.pushViewController(testVC, animated: true)
    }
}
