//
//  RankingViewController.swift
//  Quiz
//
//  Created by 伊藤 遥 on 2018/02/17.
//  Copyright © 2018年 Haruka Ito. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController, UITableViewDataSource {
    var currentScore: Int = 0
    var rankingArray = [String]()
    var saveData: UserDefaults = UserDefaults.standard
    @IBOutlet var table: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        rankingArray = saveData.object(forKey: "ranking") as! [String]
        var currentData: String = "\(currentScore)問正解"
        rankingArray.append(currentData)
        // Do any additional setup after loading the view.
        saveData.set(rankingArray, forKey: "ranking")
        
        table.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onceMore() {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = rankingArray[indexPath.row]
        
        return cell!
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
