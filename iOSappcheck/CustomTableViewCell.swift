//
//  CustomTableViewCell.swift
//  iOSappcheck
//
//  Created by Yasuteru on 2018/06/18.
//  Copyright © 2018年 Yasuteru. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell ,UIPickerViewDelegate ,UIPickerViewDataSource {

    @IBOutlet weak var elementPick: UITextField!
    @IBOutlet weak var rarityPick: UITextField!
    @IBOutlet weak var stonePick: UITextField!
   
    var delegate: UIViewController?
    var elelist = ["火","風","土","水","光","闇"]
    
    var pickerView2: UIPickerView = UIPickerView()
    var rarelist = ["レアリティ","R","SR","SSR"]
    
    var pickerView3: UIPickerView = UIPickerView()
    var summonlist = Dictionary<String, NSDictionary>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        //plistを参照
//        let path = Bundle.main.path(forResource: "stone", ofType: "plist")
//        //参照したplistを、dictionaryのsummonに納入
//        let summon = NSDictionary(contentsOfFile: path!) as! [String:NSDictionary]
//
//        // dataの中身の取り出し
//        for (element,rarity) in summon {
//            for (rarity,stone) in rarity as! NSDictionary {
//                for (stone,data) in stone  as! NSDictionary {
////                    print(summon["光"]!["R"])
////                    print(stone)
//                }
//            }
//        }
//        print(summon["光"]!["R"])

        // ピッカー2
        pickerView2.tag = 2
        pickerView2.delegate = self
        pickerView2.dataSource = self
        
        let vi2 = UIView(frame: pickerView2.bounds)
        vi2.backgroundColor = UIColor.white
        vi2.addSubview(pickerView2)
        
        rarityPick.inputView = vi2
        
//        let toolBar2 = UIToolbar()
//        toolBar2.barStyle = UIBarStyle.default
//        let doneButton2   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(CustomTableViewCell.donePressed))
//        toolBar2.setItems([doneButton2], animated: false)
//        toolBar2.isUserInteractionEnabled = true
//        toolBar2.sizeToFit()
//        rarityPick.inputAccessoryView = toolBar2
        
        // ピッカー3
        pickerView3.tag = 3
        pickerView3.delegate = self
        pickerView3.dataSource = self
        
        let vi3 = UIView(frame: pickerView3.bounds)
        vi3.backgroundColor = UIColor.white
        vi3.addSubview(pickerView3)
        
        stonePick.inputView = vi3
    }
    
    @IBAction func tapStoneName(_ sender: UITextField) {
//        print("たっぷされたよ")
        if rarityPick.text == "レアリティ" {
            print(123)
            //アラートを作る
            let alertController = UIAlertController(title: "レアリティが選択されていません", message: "選択してください", preferredStyle: .alert)
            //OKボタンを追加
            // handler はボタンが押された時に発動
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            //アラートを表示する
            //completion は動作完了時に発動
            delegate?.present(alertController, animated: true, completion: {()->Void in print("表示されたよ！")})
        }
    }
    
    // Done
    @objc func donePressed() {
        elementPick.endEditing(true)
        rarityPick.endEditing(true)
        stonePick.endEditing(true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 2 {
            return rarelist.count
        } else  {
            return summonlist.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 2 {
            return rarelist[row]
        } else {
//            let stoneNameKeys = [String](summonlist.keys)
            let stoneNameKeys = summonlist.map { $0.key }.sorted { $0 < $1 }
            return stoneNameKeys[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 2{
            rarityPick.text = rarelist[row]
            if rarelist[row] == "レアリティ" {
                return
            }
            //plistを参照
            let path = Bundle.main.path(forResource: "stone", ofType: "plist")
            //参照したplistを、dictionaryのsummonに納入
            let summon = NSDictionary(contentsOfFile: path!) as! [String:NSDictionary]
            summonlist = summon[elementPick.text!]![rarityPick.text!] as! Dictionary<String, NSDictionary>
            
//            print(summonlist)
//            print("------")
//            print(summonlist.sorted { $0.key > $1.key }.map { $0.key })

        } else {
            let stoneNameKeys = [String](summonlist.keys)
            stonePick.text = stoneNameKeys[row]
//            print(stoneNameKeys[row])
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
