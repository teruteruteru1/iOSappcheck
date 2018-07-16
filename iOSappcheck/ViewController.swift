//
//  ViewController.swift
//  iOSappcheck
//
//  Created by Yasuteru on 2018/06/18.
//  Copyright © 2018年 Yasuteru. All rights reserved.
//

import UIKit

var dictionary:[Int:[String:String]] = [:]
var elements = ["属性","属性","属性","属性","属性","属性","属性","属性"]
var rarities = ["レアリティ","レアリティ","レアリティ","レアリティ","レアリティ","レアリティ","レアリティ","レアリティ"]
var stones = ["召喚石名：レアリティを先に選択してください。","召喚石名：レアリティを先に選択してください。","召喚石名：レアリティを先に選択してください。","召喚石名：レアリティを先に選択してください。","召喚石名：レアリティを先に選択してください。","召喚石名：レアリティを先に選択してください。","召喚石名：レアリティを先に選択してください。","召喚石名：レアリティを先に選択してください。"]
var gameID = ["",""]

class ViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    var numarr = ["0","1","2","3","4","5","6","7"]
//    var stones: Array<String?> = []
    
    var CustomCell : CustomTableViewCell!
    var CustomCell2 : CustomTableViewCell2!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
    } 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 6 {
            CustomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
            CustomCell.elementPick.text = CustomCell.elelist[indexPath.row]
            CustomCell.delegate = self
            CustomCell.tag = indexPath.row
            return CustomCell
            
        }
        CustomCell2 = tableView.dequeueReusableCell(withIdentifier: "CustomCell2") as! CustomTableViewCell2
        CustomCell2.delegate = self
        CustomCell2.tag = indexPath.row
        return CustomCell2

    }

    @IBAction func tapOutput(_ sender: UIButton) {
//        print(elements)
//        print(rarities)
//        print(stones)
        let alert = UIAlertController(title: "グラブルIDを入力してください", message: "", preferredStyle: .alert)

        // カスタムテキストフィールドを追加
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
//            gameID.append(textField.text!)
            gameID[0] = textField.text!
        }
        // OKボタンの設定
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action:UIAlertAction!) -> Void in
            self.performSegue(withIdentifier: "segueko", sender: nil)
//            print(alert.textFields?.first?.text)
//            gameID.append((alert.textFields?.first?.text)!)
            gameID[0] = (alert.textFields?.first?.text)!
            print(gameID)
        })
        alert.addAction(okAction)
        
        // キャンセルボタンの設定
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true,completion: nil)
    }

//    func karappo() {
//        for i in (0..<8) {
//            if i < 6 {
//                let indexpath = IndexPath(row: i, section: 0)
//                let cell = myTableView.cellForRow(at: indexpath) as! CustomTableViewCell
//                stones.append(cell.stonePick.text!)
////                print(cell.stonePick.text)
//            } else {
//                let indexpath = IndexPath(row: i, section: 0)
//                let cell = myTableView.cellForRow(at: indexpath) as! CustomTableViewCell2
//                stones.append(cell.stonePick.text!)
////                print(cell.stonePick.text)
//            }
//        }
//    }

    //    戻ってきた時に発動する関数を先に書いて
    //    storybardでbuttonからFirstViewControllerのExitへつなぐことで戻れる
    @IBAction func exitview(segue:UIStoryboardSegue) {
//        print("もどる")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

