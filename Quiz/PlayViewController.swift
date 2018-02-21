//
//  PlayViewController.swift
//  Quiz
//
//  Created by 伊藤 遥 on 2018/02/17.
//  Copyright © 2018年 Haruka Ito. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    var seikaiCount: Int = 0
    var mondaiCount: Int = 0
    var mondaiArray = [Any]()
    @IBOutlet var mondaiTextView: UITextView!
    @IBOutlet var sentakushi1: UIButton!
    @IBOutlet var sentakushi2: UIButton!
    @IBOutlet var sentakushi3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var tmpArray = [Any]()
        
        tmpArray.append(["しのきんさんの学部は？","工学部","医学部","法学部",3])
        tmpArray.append(["しのきんさんの大学は？","東京大学","慶應大学","一橋大学",1])
        
        while tmpArray.count > 0 {
            let index = Int(arc4random()) % tmpArray.count
            mondaiArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        
        nextQuestion()
    }
    
    func nextQuestion() {
      let tmpArray = mondaiArray[0] as! [Any]
        mondaiTextView.text = tmpArray[0] as! String
        
        sentakushi1.setTitle(tmpArray[1] as? String, for: .normal)
        sentakushi2.setTitle(tmpArray[2] as? String, for: .normal)
        sentakushi3.setTitle(tmpArray[3] as? String, for: .normal)
        
    }
    
    //    全部のボタン共通
    //    正解なら正解数増やす、間違いならそのまま
    //    2問目なら終了
    @IBAction func click(sender: UIButton) {
        let tmpArray = mondaiArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag {
            seikaiCount += 1
        }
        
        mondaiArray.remove(at: 0)
        if mondaiArray.count == 0 {
            performSegueToResult()
        } else {
            nextQuestion()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.seikaiCount = self.seikaiCount
        }
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
