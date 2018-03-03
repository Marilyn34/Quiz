//
//  ViewController.swift
//  Quiz
//
//  Created by 伊藤 遥 on 2018/02/17.
//  Copyright © 2018年 Haruka Ito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var startButton: UIButton!
    @IBOutlet var createButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startButton.layer.cornerRadius = 10.0 // 角丸のサイズ
        createButton.layer.cornerRadius = 10.0 // 角丸のサイズ
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func performSegueToCreate() {
        performSegue(withIdentifier: "create", sender: nil)
    }


}

