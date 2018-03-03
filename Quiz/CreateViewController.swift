//
//  CreateViewController.swift
//  Quiz
//
//  Created by 伊藤 遥 on 2018/02/28.
//  Copyright © 2018年 Haruka Ito. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var button: UIButton!
    @IBOutlet var mondaiTF: UITextField!
    @IBOutlet var seikaiTF: UITextField!
    @IBOutlet var dammy1TF: UITextField!
    @IBOutlet var dammy2TF: UITextField!
    @IBOutlet var usernameTF: UITextField!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var createdMondai = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 10.0 // 角丸のサイズ

        // Do any additional setup after loading the view.
        mondaiTF.delegate = self
        seikaiTF.delegate = self
        dammy1TF.delegate = self
        dammy2TF.delegate = self
        usernameTF.delegate = self
    }
    
    func createMondai() {
        createdMondai.append(mondaiTF.text!)
        createdMondai.append(seikaiTF.text!)
        createdMondai.append(dammy1TF.text!)
        createdMondai.append(dammy2TF.text!)
        createdMondai.append(usernameTF.text!)
        print("\(createdMondai)")
    }
    
    @IBAction func submit() {
        createMondai()
        saveData.set(createdMondai, forKey: "new")
        let alert: UIAlertController = UIAlertController(title: "保存", message: "クイズの保存が完了しました。",
                                                         preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: { action in
                self.presentingViewController?.dismiss(animated: true, completion: nil)
                }
            )
        )
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mondaiTF.resignFirstResponder()
        seikaiTF.resignFirstResponder()
        dammy1TF.resignFirstResponder()
        dammy2TF.resignFirstResponder()
        usernameTF.resignFirstResponder()
        return true
    }
    
    @IBAction func back() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
