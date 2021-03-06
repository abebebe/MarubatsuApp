//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by NOWALL on 2016/10/12.
//  Copyright © 2016年 NOWALL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionNumLabel: UILabel!
    @IBOutlet weak var yesNum: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    // 表示中の問題番号を格納するための変数
    var currentQuestionNum: Int = 0
    // 正解数を格納するための変数
    var currentYesNum: Int = 0
    
    // 問題を保存しておくための定数
    let questions: [[String: Any]] = [
        [
            "question": "iPhoneアプリを開発する統合環境はZcodeである",
            "answer": false
        ],
        [
            "question": "Xcode画面の右側にはユーティリティー図がある",
            "answer": true
        ],
        [
            "question": "UILabelは文字列を表示する際に利用する",
            "answer": true
        ],
    ]
    
    // 問題を表示するための関数
    func showQuestion() {
        // question定数に現在の問題を格納
        let question = questions[currentQuestionNum]
        
        // question定数に格納されている問題がStringかどうかチェックする
        if let que = question["question"] as? String {
            // 問題文の表示
            questionLabel.text = que
            // 問題番号の表示 (問題番号を格納しているInt型の変数(currentQuestionNum)をString型に変換)
            questionNumLabel.text = "問題No: " + String(currentQuestionNum+1)
            // 正解数の表示
            yesNum.text = "正解数: " + String(currentYesNum)
        }
    }
    
    // 問題の正誤をチェックするための関数
    func checkAnswer(yourAnswer: Bool) {
        // question変数に現在の問題を格納
        let question = questions[currentQuestionNum]
        
        // question変数に格納されている解答がBoolean型(論理型, true or false)かどうかチェックする
        if let ans = question["answer"] as? Bool {
            
            // もし、ユーザーが選んだ解答が正解だったら
            if yourAnswer == ans {
                // currentQuestionNumを1足して次の問題に進む
                currentQuestionNum += 1
                // 正答数を+1
                currentYesNum += 1
                // アラートの表示
                showAlert(message: "正解!")
                answerLabel.text = "正解!"
            }
            else {
                // 不正解
                // アラートの表示
                showAlert(message: "不正解...")
                answerLabel.text = "不正解..."
            }
        }
        
        // currentQuestionNumの値が問題数以上だったら最初の問題に戻す
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
        
        // 問題を表示します
        // 正解であれば次の問題が、不正解であれば同じ問題が再表示されます。
        showQuestion()
    }
    
    // アラートを表示させるための関数(引数として表示させたいmessageをString型で受け取る)
    func showAlert(message: String) {
        // アラートを表示させるための準備 (alertControllerをオブジェクト化)
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        // アラートを閉じるための準備
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        // 作成したアラートオブジェクトにcloseイベントを追加
        alert.addAction(close)
        // 作成したアラートを表示
        present(alert, animated: true, completion: nil)
    }
    

    // ばつボタンを押したときに呼ばれる関数
    @IBAction func tappedNoButton(_ sender: UIButton) {
        // 問題の正誤を判定 (関数の引数としてfalseをわたす)
        checkAnswer(yourAnswer: false)
        
    }
    
    // まるボタンを押したときに呼ばれる関数
    @IBAction func tappedYesButton(_ sender: UIButton) {
        // 問題の正誤を判定 (関数の引数としてtrueをわたす)
        checkAnswer(yourAnswer: true)
    }
    
    // ロードされたときに呼び出される関数
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 問題を表示
        showQuestion()
    }
}

