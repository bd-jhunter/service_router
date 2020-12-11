//
//  ViewController.swift
//  Runner
//
//  Created by hunter.liu on 2020/12/11.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    private var engine: FlutterEngine {
        (UIApplication.shared.delegate as! AppDelegate).engine
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "我是Native"
    }
    
    @IBAction func tapFlutterButton(_ sender: UIButton) {
        let vc = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        vc.pushRoute("/host/rootPage")
    }
}
