//
//  Question.swift
//  Quizzler
//
//  Created by Sergey on 30.01.2023.
//

import Foundation

struct Question {
    
    let textOfQuestion: String
    let answersOfQuestion: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], c: String) {
        self.textOfQuestion = q
        self.answersOfQuestion = a
        self.correctAnswer = c
    }
    
}
