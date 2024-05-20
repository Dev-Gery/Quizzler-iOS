//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var opt2Button: UIButton!
    @IBOutlet weak var opt3Button: UIButton!
    @IBOutlet weak var opt1Button: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
//    var quiz = QuizBrain()
    var multiQuiz = MultiQuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        sender.backgroundColor = multiQuiz.checkAnswer(sender.currentTitle) ? UIColor.green : UIColor.red
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
            sender.backgroundColor = UIColor.clear
            self.updateUI()
            sender.isEnabled = true
            timer.invalidate()
        }
    }
    
    func updateUI() {
        let quizItems = multiQuiz.nextQuiz()
        questionLabel.text = quizItems["text"]
        opt1Button.setTitle(quizItems["answer1"], for: .normal)
        opt2Button.setTitle(quizItems["answer2"], for: .normal)
        opt3Button.setTitle(quizItems["answer3"], for: .normal)
        progressBar.progress = multiQuiz.checkProgress()
        scoreLabel.text = "Score: \(multiQuiz.checkScore())"
    }
}
//        questionLabel.text = quiz.nextQuestion()
//        progressBar.progress = quiz.checkProgress()
//        scoreLabel.text = "Score: \(quiz.checkScore())"
//        scoreLabel.text = scoreLabel.text!.split(separator: " ")[0] + " " + quiz.checkScore()
//                guard quizNum >= 0 && quizNum < quiz.count else {
//                    print("Index /(quizNum) is out of range")
//                    return
//                }
        
        
//        let val: ValueType? = (quiz[safe: quizId] != nil) ? quiz[quizId]["question"] : .stringValue("out of bounds.")
//        let stringVal = val?.extractStringValue()
//        let stringValue: String? = {
//            switch val {
//            case .some(.stringValue(let string)):
//                return string
//            default:
//                return nil
//            }
//        }()

    

