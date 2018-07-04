//
//  CustomTableViewCell3.swift
//  iOSappcheck
//
//  Created by Yasuteru on 2018/07/03.
//  Copyright © 2018年 Yasuteru. All rights reserved.
//

import UIKit

class CustomTableViewCell3: UITableViewCell {


    @IBOutlet weak var myIDLabel: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        myIDLabel.keyboardType = UIKeyboardType.numberPad
//        
//        let toolBar = UIToolbar()
//        toolBar.barStyle = UIBarStyle.default
//        let doneButton   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(CustomTableViewCell3.donePressed))
//        toolBar.setItems([doneButton], animated: false)
//        toolBar.isUserInteractionEnabled = true
//        toolBar.sizeToFit()
//        myIDLabel.inputAccessoryView = toolBar
    }
    
    // Done
    @objc func donePressed() {
        myIDLabel.endEditing(true)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
