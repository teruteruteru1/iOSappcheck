//
//  SecondViewController.swift
//  iOSappcheck
//
//  Created by Yasuteru on 2018/06/25.
//  Copyright © 2018年 Yasuteru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var element = ["火属性召喚石","風属性召喚石","土属性召喚石","水属性召喚石","光属性召喚石","闇属性召喚石","フリー枠召喚石","フリー枠召喚石"]
    
    var Cell1 : OutputCell1!
    var Cell2 : OutputCell2!
    var View1 : ViewController!
    
    var selectedName : Array<String?> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
//        print(View1.stones)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row < 8 {
            Cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as! OutputCell1
            Cell1.elementlabel.text = element[indexPath.row]
//            Cell1.summonlabel.text = View1.stones[indexPath.row]
            
            
            return Cell1
        } else {
            Cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! OutputCell2
            return Cell2
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
