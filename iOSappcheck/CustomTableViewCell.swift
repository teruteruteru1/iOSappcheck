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
   
    var pickerView1: UIPickerView = UIPickerView()
    var elelist = ["火","風","土","水","光","闇"]
    
    var pickerView2: UIPickerView = UIPickerView()
    var rarelist = ["R","SR","SSR"]
    
    //    var elelist = [Dictionary<String, String>]
    //    var rarelist = [Dictionary<String, String>]
    lazy var all = [elelist,rarelist]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //plistを参照
        let path = Bundle.main.path(forResource: "stone", ofType: "plist")
        //参照したplistを、初期化した配列に納入
        let elements = NSDictionary(contentsOfFile: path!) as! NSDictionary
//        let hoge = elements.allValues as! NSDictionary
//        let fuga = hoge.allkyes
        print(fuga)
        
//        let rarity = NSDictionary(contentsOfFile: path![elements])

//        for (key,data) in stones! {
////            let hoge = ((data as AnyObject).allKeys)
////            print(stones) // 確認用
////            let title = key as! String
////            let dic = data as! NSDictionary
//
//            // dataの中身の取り出し
//        }
      

        
        // ピッカー１
        pickerView1.tag = 1
        pickerView1.delegate = self
        pickerView1.dataSource = self

        let vi1 = UIView(frame: pickerView1.bounds)
        vi1.backgroundColor = UIColor.white
        vi1.addSubview(pickerView1)
        
        elementPick.inputView = vi1
        
        let toolBar1 = UIToolbar()
        toolBar1.barStyle = UIBarStyle.default
        let doneButton1   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(CustomTableViewCell.donePressed))
        toolBar1.setItems([doneButton1], animated: false)
        toolBar1.isUserInteractionEnabled = true
        toolBar1.sizeToFit()
        elementPick.inputAccessoryView = toolBar1

        // ピッカー2
        pickerView2.tag = 2
        pickerView2.delegate = self
        pickerView2.dataSource = self
        
        let vi2 = UIView(frame: pickerView2.bounds)
        vi2.backgroundColor = UIColor.white
        vi2.addSubview(pickerView2)
        
        rarityPick.inputView = vi2
        
        let toolBar2 = UIToolbar()
        toolBar2.barStyle = UIBarStyle.default
        let doneButton2   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(CustomTableViewCell.donePressed))
        toolBar2.setItems([doneButton2], animated: false)
        toolBar2.isUserInteractionEnabled = true
        toolBar2.sizeToFit()
        rarityPick.inputAccessoryView = toolBar2
        
    }
    
    // Done
    @objc func donePressed() {
        elementPick.endEditing(true)
        rarityPick.endEditing(true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return elelist.count
        } else if pickerView.tag == 2 {
            return rarelist.count
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {    // <<<<<<<<<<　変更
            return elelist[row]
        } else {
            return rarelist[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            elementPick.text = elelist[row]
        } else {
            rarityPick.text = rarelist[row]
        }

    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
