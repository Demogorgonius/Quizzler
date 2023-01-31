//
//  Question.swift
//  Quizzler
//
//  Created by Sergey on 30.01.2023.
//

import Foundation

struct Question {
    
    let textOfQuestion: String
    let answerOfQuestion: String
    
    init(q: String, a: String) {
        self.textOfQuestion = q
        self.answerOfQuestion = a
    }
    
}
