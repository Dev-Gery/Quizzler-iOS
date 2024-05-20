//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Gery Josua Sumual on 15/05/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

//let quiz: [Question] = [
//    Question(q: "A slug's blood is green.", a: "True"),
//    Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
//    Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
//    Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
//    Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
//    Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
//    Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
//    Question(q: "Google was originally called 'Backrub'.", a: "True"),
//    Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
//    Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
//    Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
//    Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
//]
//
//struct QuizBrain {
//    var num : Int = 0
//    var score: [String: Int] = ["current": 0, "previous": 0,"all": 0]
//    let total : Int = quiz.count
//    
//    func quizId() -> Int {
//        return num % total
//    }
//    
//    func quizAnswerLowerCased() -> String {
//        return quiz[quizId()].answer.lowercased()
//    }
//    
//    mutating func nextQuestion() -> String {
//        num += 1
//        return quiz[quizId()].text
//    }
//    
//    mutating func checkAnswer(_ answer: String?) -> Bool {
//        answer?.lowercased() == quiz[quizId()].answer.lowercased() ? { addScore(); return true}() : false
//    }
//    
//    func checkProgress() -> Float {
//        Float(quizId() + 1) / Float(total)
//    }
//    
//    mutating func addScore() {
//        score["current"]! += 1
//        score["all"]! += 1
//    }
//    
//    mutating func checkScore() -> String {
//        if quizId() == 0 {
//            (score["previous"], score["current"]) = (score["current"]!, 0)
//            return String(score["previous"]!) + " (previous round)"
//        } else {
//            return String(score["current"]!)
//        }
//    }
//}
//
//
//
let multiQuiz : [multiAnswerQuestion] = [
    multiAnswerQuestion(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
    multiAnswerQuestion(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
    multiAnswerQuestion(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
    multiAnswerQuestion(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
    multiAnswerQuestion(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
    multiAnswerQuestion(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
    multiAnswerQuestion(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
    multiAnswerQuestion(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
    multiAnswerQuestion(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
    multiAnswerQuestion(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
]


struct MultiQuizBrain {
    var num : Int = -1
    var score: [String: Int] = ["current": 0, "previous": 0,"all": 0]
    let total : Int = multiQuiz.count
    
    func quizId() -> Int {
        return num % total
    }
    
    mutating func nextQuiz() -> [String: String] {
        num += 1
        let quiz = ["text": multiQuiz[quizId()].text, "answers" : multiQuiz[quizId()].answers.shuffled()] as [String : Any]
        let items : [String: String] = [
            "text": (quiz["text"] as? String)!,
            "answer1": (quiz["answers"] as? [String])![0],
            "answer2": (quiz["answers"] as? [String])![1],
            "answer3": (quiz["answers"] as? [String])![2]
        ]
        return items
    }
    
    
    mutating func checkAnswer(_ answer: String?) -> Bool {
        return answer?.lowercased() == multiQuiz[quizId()].correctAnswer.lowercased() ? { addScore(); return true }() : false
    }
    
    func checkProgress() -> Float {
        Float(quizId() + 1) / Float(total)
    }
    
    mutating func addScore() {
        score["current"]! += 1
        score["all"]! += 1
    }
    
    mutating func checkScore() -> String {
        if quizId() == 0 && num / total >= 1 {
            (score["previous"], score["current"]) = (score["current"]!, 0)
            return String(score["previous"]!) + " (previous round)"
        } else {
            return String(score["current"]!)
        }
    }
}

//    let quiz: [[String: ValueType]] = [
//        ["question": .stringValue("Four + Two is equal to Six."), "answer": .boolValue(true)]
//    ]


//enum ValueType {
//    case stringValue( {)
//    case boolValue(Bool)
//}
//
//extension ValueType {
//    func extractStringValue() ->  String? {
//        if case .stringValue(let string) = self {
//            return string
//        }
//        return nil
//    }
//}
