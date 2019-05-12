//
//  ViewController.swift
//  calcQuizApp
//
//  Created by 石川佑樹 on 2019/05/12.
//  Copyright © 2019 石川佑樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    //足し算に使う変数を用意します
    var a = 0
    var b = 0
    var correct = 0
    
    //出題をする関数
    func question() {
        //ランダムに問題を作ります
        a = Int(arc4random() % 100)
        b = Int(arc4random() % 100)
        correct = a + b
        //ラベルに問題を表示します
        myLabel.text = "\(a) + \(b) = ?"
        //テキストフィールドを空にします
        myTextField.text = ""
    }
    
    
    
    @IBAction func tapButton(_ sender: Any) {
        //整数が入力されているかチェックします
        guard let answer = Int(myTextField.text!) else {
            return
        }
        //答え合わせをします
        var check = "間違い"
        if answer == correct {
            check = "正解"
        }
        
        //ダイアログを作ります
        let alert = UIAlertController(title: "足し算クイズ", message: check, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title:  "OK", style: .default, handler: {action in
            //正解だったら次の出題をします
            if answer == self.correct{
                self.question()
            }
        })
        alert.addAction(defaultAction)
        //ダイアログを表示させます
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //出題をする関数を呼び出します
        question()
        // Do any additional setup after loading the view.
    }


}

