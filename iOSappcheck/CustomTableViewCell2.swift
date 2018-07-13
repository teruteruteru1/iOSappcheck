//
//  CustomTableViewCell2.swift
//  iOSappcheck
//
//  Created by Yasuteru on 2018/06/22.
//  Copyright © 2018年 Yasuteru. All rights reserved.
//

import UIKit

class CustomTableViewCell2: UITableViewCell ,UIPickerViewDelegate ,UIPickerViewDataSource{
    
    @IBOutlet weak var elementPick: UITextField!
    @IBOutlet weak var rarityPick: UITextField!
    @IBOutlet weak var stonePick: UITextField!    
    
    var delegate: UIViewController?
    
    var pickerView1: UIPickerView = UIPickerView()
    var elelist = ["火","風","土","水","光","闇"]
    var elelist2 = ["属性","火","風","土","水","光","闇"]
    
    var pickerView2: UIPickerView = UIPickerView()
    var rarelist = ["レアリティ","R","SR","SSR"]
    
    var pickerView3: UIPickerView = UIPickerView()
    var summonlist = Dictionary<String, NSDictionary>()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        elementPick.attributedPlaceholder = NSAttributedString(string: "属性", attributes: [NSAttributedStringKey.foregroundColor : UIColor.black])
        rarityPick.attributedPlaceholder = NSAttributedString(string: "レアリティ", attributes: [NSAttributedStringKey.foregroundColor : UIColor.black])
        stonePick.attributedPlaceholder = NSAttributedString(string: "召喚石名", attributes: [NSAttributedStringKey.foregroundColor : UIColor.black])
        
        // ピッカー１
        pickerView1.tag = 1
        pickerView1.delegate = self
        pickerView1.dataSource = self
        
        let vi1 = UIView(frame: pickerView1.bounds)
        vi1.backgroundColor = UIColor.white
        vi1.addSubview(pickerView1)
        
        print(vi1)
        elementPick.inputView = vi1
        
//        let toolBar1 = UIToolbar()
//        toolBar1.barStyle = UIBarStyle.default
//        let doneButton1   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(CustomTableViewCell.donePressed))
//        toolBar1.setItems([doneButton1], animated: false)
//        toolBar1.isUserInteractionEnabled = true
//        toolBar1.sizeToFit()
//        elementPick.inputAccessoryView = toolBar1
        
        // ピッカー2
        pickerView2.tag = 2
        pickerView2.delegate = self
        pickerView2.dataSource = self
        
        let vi2 = UIView(frame: pickerView2.bounds)
        vi2.backgroundColor = UIColor.white
        vi2.addSubview(pickerView2)
        
        rarityPick.inputView = vi2
        
        // ピッカー3
        pickerView3.tag = 3
        pickerView3.delegate = self
        pickerView3.dataSource = self
        
        let vi3 = UIView(frame: pickerView3.bounds)
        vi3.backgroundColor = UIColor.white
        vi3.addSubview(pickerView3)
        
        stonePick.inputView = vi3
        
    }
    @IBAction func tapStoneName2(_ sender: UITextField) {
        print("たっぷされたよ")
        if rarityPick.text == "レアリティ" || elementPick.text == "属性" {
            print(123)
            //アラートを作る
            let alertController = UIAlertController(title: "レアリティ又は属性が選択されていません", message: "選択してください", preferredStyle: .alert)
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
        if pickerView.tag == 1 {
            return elelist2.count
        } else if pickerView.tag == 2 {
            return rarelist.count
        } else {
            return summonlist.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return elelist2[row]
        } else if pickerView.tag == 2 {
            return rarelist[row]
        } else {
//            let stoneNameKeys = [String](summonlist.keys)
            let stoneNameKeys = summonlist.map { $0.key }.sorted { $0 < $1 }
            return stoneNameKeys[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            elementPick.text = elelist2[row]
            elements[self.tag] = elementPick.text!
            
            if rarityPick.text != "レアリティ" {
                let path = Bundle.main.path(forResource: "stone", ofType: "plist")
                //参照したplistを、dictionaryのsummonに納入
                let summon = NSDictionary(contentsOfFile: path!) as! [String:NSDictionary]
                summonlist = summon[elementPick.text!]![rarityPick.text!] as! Dictionary<String, NSDictionary>
//                print(summonlist)
            }
        } else if pickerView.tag == 2{
            rarityPick.text = rarelist[row]
            rarities[self.tag] = rarityPick.text!
            if elementPick.text != "属性" {
                //plistを参照
                let path = Bundle.main.path(forResource: "stone", ofType: "plist")
                //参照したplistを、dictionaryのsummonに納入
                let summon = NSDictionary(contentsOfFile: path!) as! [String:NSDictionary]
                summonlist = summon[elementPick.text!]![rarityPick.text!] as! Dictionary<String, NSDictionary>
//                print(summonlist)
            }
        } else {
//            let stoneNameKeys = [String](summonlist.keys)
            let stoneNameKeys = summonlist.map { $0.key }.sorted { $0 < $1 }
            stonePick.text = stoneNameKeys[row]
            stones[self.tag] = stonePick.text!
        }
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
