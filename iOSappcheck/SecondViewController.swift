//
//  SecondViewController.swift
//  iOSappcheck
//
//  Created by Yasuteru on 2018/06/25.
//  Copyright © 2018年 Yasuteru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource {

    @IBOutlet weak var myOutputView: UIView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    lazy var shareImage = getImage(myOutputView) as UIImage
    
    var element = ["火属性召喚石","風属性召喚石","土属性召喚石","水属性召喚石","光属性召喚石","闇属性召喚石","フリー枠召喚石","フリー枠召喚石"]
    
    var Cell1 : OutputCell1!
    var Cell2 : OutputCell2!
    var View1 : ViewController!
    
    var stoneName = Dictionary<String, NSDictionary>()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
//        // 保存対象の UIImageView を作る
//        let imageView = UIImageView(image: UIImage(named: "sample.png"))
//        imageView.frame.size = CGSize(width: 960, height: 540)
        
//        print(stones)
//        print(elements)
//        print(rarities)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
        if indexPath.row < 8 {
            Cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as! OutputCell1
            Cell1.elementlabel.text = element[indexPath.row]

            if element[indexPath.row] == "属性" || rarities[indexPath.row] == "レアリティ" {
                Cell1.summonlabel.text = ""
                Cell1.imageview.image = UIImage(named: "empty")
                Cell1.detailview.text = ""
            } else {
                //plistを参照
                let path = Bundle.main.path(forResource: "stone", ofType: "plist")
                //参照したplistを、dictionaryのsummonに納入
                let summon = NSDictionary(contentsOfFile: path!) as! [String:NSDictionary]
                stoneName = summon[elements[indexPath.row]!]![rarities[indexPath.row]] as! Dictionary<String, NSDictionary>
            
                if stones[indexPath.row] == "召喚石名：属性からタップして選択してください。" {
                    Cell1.imageview.image = UIImage(named: "empty")
                } else {
                    Cell1.summonlabel.text = stones[indexPath.row]
                    Cell1.imageview.image = UIImage(named: (stoneName[stones[indexPath.row]!]!["img"] as! CGImage) as! String)
                    if (stones[indexPath.row]?.contains("3"))! {
                        Cell1.detailview.text = stoneName[stones[indexPath.row]!]!["description"]! as! String
                        Cell1.detailview.textColor = UIColor.orange
                    } else if (stones[indexPath.row]?.contains("4"))! {
                        Cell1.detailview.text = stoneName[stones[indexPath.row]!]!["description"]! as! String
                        Cell1.detailview.textColor = UIColor.purple
                    } else {
                        Cell1.detailview.text = stoneName[stones[indexPath.row]!]!["description"]! as! String
                    }
                }
            }
//            print(stoneName[stones[indexPath.row]!]!["img"])
//            print(summonlist["スピリット"]!["description"]
//            print(stoneName)

            return Cell1
        } else {
            Cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! OutputCell2
            Cell2.IDLabel.text = gameID[1]
            return Cell2
        }
    }
    
    // UIViewからUIImageに変換する
    func getImage(_ outputview : UIView) -> UIImage {
        // キャプチャする範囲を取得する
        let rect = outputview.frame
        // ビットマップ画像のcontextを作成する
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context : CGContext = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0.0, y: -outputview.frame.origin.y)
    
        // view内の描画をcontextに複写する
        self.view.layer.render(in: context)
        // contextのビットマップをUIImageとして取得する
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        // contextを閉じる
        UIGraphicsEndImageContext()
        return image
    }
    
    @IBAction func tapSave(_ sender: UIBarButtonItem) {
        // カメラロールに保存する
        UIImageWriteToSavedPhotosAlbum(getImage(myOutputView), self, nil, nil)
    }
    
    
    // 保存を試みた結果を受け取る
    @objc func didFinishSavingImage(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {

        // 結果によって出すアラートを変更する
        var title = "保存完了"
        var message = "カメラロールに保存しました"

        if error != nil {
            title = "エラー"
            message = "保存に失敗しました"
        }

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func tapShare(_ sender: UIBarButtonItem) {
        // シェア用画面の作成
        let controller = UIActivityViewController(activityItems: [shareImage,"文章が入れられます"], applicationActivities: nil)
        controller.popoverPresentationController?.sourceView = self.view
        // シェア用画面
        present(controller,animated: true,completion: nil)
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
