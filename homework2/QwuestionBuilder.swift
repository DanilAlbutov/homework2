//
//  QuestionBuilder.swift
//  homework2
//
//  Created by Данил Албутов on 27.10.2021.
//

import Foundation
import SwiftUI
struct Question {
    var qestionImageView: UIImageView!
    var resultAnswer = ""
    var rightAnswer = ""
    var answerOptions: [String] = []
}

class QwuestionBuilder {
    var questionList: [Question] = []
    
    func saveNewQuestion(qestionImageView: UIImageView, resultAnswer: String, rightAnswer: String, answerOptions: [String]) {
        questionList.append(Question(qestionImageView: qestionImageView, resultAnswer: resultAnswer, rightAnswer: rightAnswer, answerOptions: answerOptions))
    }
    
    
}
