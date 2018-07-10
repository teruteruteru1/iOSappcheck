//
//  ViewController.swift
//  iOSappcheck
//
//  Created by Yasuteru on 2018/06/18.
//  Copyright © 2018年 Yasuteru. All rights reserved.
//

import UIKit

var elements: Array<String?> = []
var rarities: Array<String?> = []
var stones: Array<String?> = []
var gameID = [String]()

class ViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
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
            return CustomCell
        }
        CustomCell2 = tableView.dequeueReusableCell(withIdentifier: "CustomCell2") as! CustomTableViewCell2
        CustomCell2.delegate = self
        return CustomCell2
    }

    @IBAction func tapOutput(_ sender: UIButton) {
        karappo()
        karappo2()
        karappo3()
        let alert = UIAlertController(title: "グラブルIDを入力してください", message: "", preferredStyle: .alert)

        // カスタムテキストフィールドを追加
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
            gameID.append(textField.text!)
        }
        // OKボタンの設定
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action:UIAlertAction!) -> Void in
            self.performSegue(withIdentifier: "segueko", sender: nil)
//            print(alert.textFields?.first?.text)
            gameID.append((alert.textFields?.first?.text)!)
            print(gameID)
        })
        alert.addAction(okAction)
        
        // キャンセルボタンの設定
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true,completion: nil)
    }
    
    func karappo() {
        for i in (0..<8) {
            if i < 6 {
                let indexpath = IndexPath(row: i, section: 0)
                let cell = myTableView.cellForRow(at: indexpath) as! CustomTableViewCell
                stones.append(cell.stonePick.text!)
//                print(cell.stonePick.text)
            } else {
                let indexpath = IndexPath(row: i, section: 0)
                let cell = myTableView.cellForRow(at: indexpath) as! CustomTableViewCell2
                stones.append(cell.stonePick.text!)
//                print(cell.stonePick.text)
            }
        }
    }
    func karappo2() {
        for i in (0..<8) {
            if i < 6 {
                let indexpath = IndexPath(row: i, section: 0)
                let cell = myTableView.cellForRow(at: indexpath) as! CustomTableViewCell
                elements.append(cell.elementPick.text!)
                //                print(cell.stonePick.text)
            } else {
                let indexpath = IndexPath(row: i, section: 0)
                let cell = myTableView.cellForRow(at: indexpath) as! CustomTableViewCell2
                elements.append(cell.elementPick.text!)
                //                print(cell.stonePick.text)
            }
        }
    }
    func karappo3() {
        for i in (0..<8) {
            if i < 6 {
                let indexpath = IndexPath(row: i, section: 0)
                let cell = myTableView.cellForRow(at: indexpath) as! CustomTableViewCell
                rarities.append(cell.rarityPick.text!)
                //                print(cell.stonePick.text)
            } else {
                let indexpath = IndexPath(row: i, section: 0)
                let cell = myTableView.cellForRow(at: indexpath) as! CustomTableViewCell2
                rarities.append(cell.rarityPick.text!)
                //                print(cell.stonePick.text)
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

