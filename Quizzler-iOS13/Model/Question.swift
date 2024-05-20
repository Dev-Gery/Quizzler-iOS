//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Gery Josua Sumual on 14/05/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
//
//struct Question {
//    let text: String, answer: String
//    init(q: String, a: String) {
//        (text, answer) = (q, a)
//    }
//}

struct multiAnswerQuestion {
    let text: String, answers: [String], correctAnswer: String
    init(q: String, a: [String], correctAnswer: String) {
        (text, answers, self.correctAnswer) = (q, a, correctAnswer)
    }
}
