//
//  ViewController.swift
//  iOSappcheck
//
//  Created by Yasuteru on 2018/06/18.
//  Copyright © 2018年 Yasuteru. All rights reserved.
//

import UIKit

var stones: Array<String?> = []

class ViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
//    var stones: Array<String?> = []
    
    var CustomCell : CustomTableViewCell!
    var CustomCell2 : CustomTableViewCell2!
    var CustomCell3 : CustomTableViewCell3!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTableView.delegate = self
        myTableView.dataSource = self

    } 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < 6 {
            CustomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
            CustomCell.elementPick.text = CustomCell.elelist[indexPath.row]
            CustomCell.delegate = self
            return CustomCell
            
        } else if indexPath.row > 5 && indexPath.row < 8 {
            CustomCell2 = tableView.dequeueReusableCell(withIdentifier: "CustomCell2") as! CustomTableViewCell2
            CustomCell2.delegate = self
            return CustomCell2
            
        }
        CustomCell3 = tableView.dequeueReusableCell(withIdentifier: "CustomCell3") as! CustomTableViewCell3
        return CustomCell3
    }

    @IBAction func tapOutput(_ sender: UIButton) {
        karappo()
//        self.performSegue(withIdentifier: "segueko", sender: nil)
        print(stones)
    }
    
    
    func karappo() {
        for i in (0..<9) {
            if i < 6 {
                let indexpath = IndexPath(row: i, section: 0)
                let cell = myTableView.cellForRow(at: indexpath) as! CustomTableViewCell
                stones.append(cell.stonePick.text!)

//                print(cell.stonePick.text)
            } else if i > 5 && i < 8 {
                let indexpath = IndexPath(row: i, section: 0)
                let cell = myTableView.cellForRow(at: indexpath) as! CustomTableViewCell2
                stones.append(cell.stonePick.text!)
                
//                print(cell.stonePick.text)
            } else {
                stones.append(CustomCell3.myIDLabel.text)
            }
        }
        
    }
    //    戻ってきた時に発動する関数を先に書いて
    //    storybardでbuttonからFirstViewControllerのExitへつなぐことで戻れる
    @IBAction func exitview(segue:UIStoryboardSegue) {
        print("もどる")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

