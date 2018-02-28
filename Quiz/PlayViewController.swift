//
//  PlayViewController.swift
//  Quiz
//
//  Created by 伊藤 遥 on 2018/02/17.
//  Copyright © 2018年 Haruka Ito. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    var time: Float = 5.0
    var timer: Timer = Timer()
    @IBOutlet var timeLabel: UILabel!
    var seikaiCount: Int = 0
    var mondaiArray = [[Any]]()
    @IBOutlet var mondaiTextView: UITextView!
    @IBOutlet var sentakushi1: UIButton!
    @IBOutlet var sentakushi2: UIButton!
    @IBOutlet var sentakushi3: UIButton!
    var mondaiCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var tmpArray = [[Any]]()
        
        tmpArray.append(["しのきんさんの学部は？","法学部","医学部","工学部"])
        tmpArray.append(["しのきんさんの大学は？","東京大学","慶應大学","一橋大学"])
        tmpArray.append(["しのきんさんの担当コースは？","iPhone","Android","WebD"])
        tmpArray.append(["しのきんさんの趣味は？","スニーカー集め","カラオケ","ゴルフ"])
        
        mondaiCount = tmpArray.count
        
        while tmpArray.count > 0 {
            let index = Int(arc4random()) % tmpArray.count
            mondaiArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        
        nextQuestion()
    }
    
    func nextQuestion() {
        
        if !timer.isValid {
            time = 5.0
            timer = Timer.scheduledTimer(timeInterval: 0.1,
                                         target: self,
                                         selector: #selector(self.down),
                                         userInfo: nil,
                                         repeats: true)
        }
        var currentMondaiArray = mondaiArray[0]
        mondaiTextView.text = currentMondaiArray[0] as! String
        let answer = currentMondaiArray[1]
        let wrong1 = currentMondaiArray[2]
        let wrong2 = currentMondaiArray[3]
        
        var tmpArray = [Any]()
        
        tmpArray.append(answer)
        tmpArray.append(wrong1)
        tmpArray.append(wrong2)
        
        var sentakushiArray = [Any]()
        
        while tmpArray.count > 0 {
            let index = Int(arc4random()) % tmpArray.count
            sentakushiArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        
        sentakushi1.setTitle(sentakushiArray[0] as? String, for: .normal)
        sentakushi2.setTitle(sentakushiArray[1] as? String, for: .normal)
        sentakushi3.setTitle(sentakushiArray[2] as? String, for: .normal)
        
    }
    
    //    全部のボタン共通
    @IBAction func click(sender: UIButton) {
        let seikai = mondaiArray[0][1] as? String
        let buttonTitle = sender.title(for: .normal)
        
        if buttonTitle == seikai {
            seikaiCount += 1
            if timer.isValid {
                timer.invalidate()
            }
            toNext()
        } else {
            time -= 2.0
        }
    }
    
    func toNext() {
        mondaiArray.remove(at: 0)
        if mondaiArray.count == 0 {
            performSegueToResult()
        } else {
            nextQuestion()
        }
    }
    
    @objc func down() {
        time -= 0.1
        timeLabel.text = String(format: "%.2f", time)
        if time < -0.01 {
            if timer.isValid {
                print("時間切れ")
                timer.invalidate()
            }
            toNext()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.seikaiCount = self.seikaiCount
            resultViewController.mondaiCount = self.mondaiCount
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
