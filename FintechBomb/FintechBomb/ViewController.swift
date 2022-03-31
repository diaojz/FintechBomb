//
//  ViewController.swift
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/11.
//

import UIKit
import DesignKit
//import Flutter
import Flutter

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.designKit.background

        let avatarImageView: UIImageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        avatarImageView.asAvatar(cornerRadius: 20)
        avatarImageView.backgroundColor = .systemPink
        self.view.addSubview(avatarImageView)

        let titleLabel = UILabel(frame: CGRect(x: 100, y: 220, width: 300, height: 50))
        titleLabel.text = "玩命写代码..."
        titleLabel.textColor = UIColor.designKit.primaryText
        self.view.addSubview(titleLabel)
        
        
        let testButton = UIButton(frame: CGRect(x: 20, y: 500, width: 200, height: 40))
        testButton.tintColor = UIColor.designKit.primary
        testButton.backgroundColor = UIColor.orange
        testButton.setTitle("进入测试VC", for: .normal)
        testButton.addTarget(self, action: #selector(testButtonClicked), for: .touchUpInside)
        view.addSubview(testButton)
        
        let flutterButton = UIButton(frame: CGRect(x: 20, y: 600, width: 200, height: 40))
        flutterButton.tintColor = UIColor.designKit.primary
        flutterButton.backgroundColor = UIColor.orange
        flutterButton.setTitle("进入Flutter的VC", for: .normal)
        flutterButton.addTarget(self, action: #selector(flutterButtonClicked), for: .touchUpInside)
        view.addSubview(flutterButton)

        let debugButton = UIButton(frame: CGRect(x: 20, y: 700, width: 200, height: 40))
        debugButton.tintColor = UIColor.designKit.primary
        debugButton.backgroundColor = UIColor.orange
        debugButton.setTitle("进入debug的VC", for: .normal)
        debugButton.addTarget(self, action: #selector(debugButtonClicked), for: .touchUpInside)
        view.addSubview(debugButton)

    }

    @objc func testButtonClicked() {
        let testVC = DDTestViewController()
        navigationController?.pushViewController(testVC, animated: true)
    }
    
    @objc func flutterButtonClicked() {
//        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
//        let flutterVC = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
//        present(flutterVC, animated: true) {
//            print("进入了 flutterVC页面了...")
//        }
        
        let flutterVC = FlutterViewController(project: nil, nibName: nil, bundle: nil);
        present(flutterVC, animated: true, completion: nil);
    }
    
    @objc func debugButtonClicked() {
//        let debugVC = DebugMenuViewController()
//        present(debugVC, animated: true, completion: nil)
        
//        testPrint()
        
        
    }
    
    func testPrint() {
//        print(
//            [("b", "a"),
//             ("3", "2"),
//             ("1", "0")]
//                .sorted{ $0.0 < $1.0 } // 1
//                .compactMap { Int($0.1) } // 2
//                .dropLast() // 3
//                .reduce(10, /) // 4
//        )
        
        print([("b", "a"), ("3", "2"), ("1", "0")].sorted{ $0.0 < $1.0})
    }
}
