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
    var mondaiArray = [[Any]]()
    let sentakushi: Int = 3
    @IBOutlet var mondaiTextView: UITextView!
    @IBOutlet var sentakushi1: UIButton!
    @IBOutlet var sentakushi2: UIButton!
    @IBOutlet var sentakushi3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var tmpArray = [[Any]]()
        
        tmpArray.append(["しのきんさんの学部は？","法学部","医学部","工学部",1])
        tmpArray.append(["しのきんさんの大学は？","東京大学","慶應大学","一橋大学",1])
        
        while tmpArray.count > 0 {
            let index = Int(arc4random()) % tmpArray.count
            mondaiArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        
        nextQuestion()
    }
    
    func nextQuestion() {
      var currentMondaiArray = mondaiArray[0] as! [Any]
        mondaiTextView.text = currentMondaiArray[0] as! String
//        答えの要素番号を別の変数に代入しておく
//        配列を用意してtmpArray[1]~[3]までをバラバラの順番で入れる(arc4randomで要素番号持ってきてリムーブする)
//        その時の乱数が答えの要素番号と等しければmondaiArray[0][4]をその要素番号に変更する
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
        
        
        
        
//        let seikai: Int = tmpArray[4] as! Int
//        var tmp2Array = [Any]()
//
//        var i: Int = sentakushi
//        while i > 0 {
//            let index = Int(arc4random()) % i
//            tmp2Array.append(tmpArray[index+1])
//            if index+1 == seikai {
//                mondaiArray[0][4] = tmp2Array.count
//            }
//            tmpArray.remove(at: index)
//            i -= 1
//
//        }
//
        sentakushi1.setTitle(sentakushiArray[0] as? String, for: .normal)
        sentakushi2.setTitle(sentakushiArray[1] as? String, for: .normal)
        sentakushi3.setTitle(sentakushiArray[2] as? String, for: .normal)
        
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
        print("\(seikaiCount)問正解")
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
