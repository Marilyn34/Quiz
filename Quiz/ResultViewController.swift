//
//  ResultViewController.swift
//  Quiz
//
//  Created by 伊藤 遥 on 2018/02/17.
//  Copyright © 2018年 Haruka Ito. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var seikaiCount: Int = 0
    
    @IBOutlet var seikaiLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        seikaiLabel.text = String(seikaiCount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func toRanking() {
        
    }
    
    func performSegueToRanking() {
        performSegue(withIdentifier: "toRanking", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRanking" {
            let rankingViewController = segue.destination as! RankingViewController
            rankingViewController.currentScore = self.seikaiCount
        }
    }
    
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
