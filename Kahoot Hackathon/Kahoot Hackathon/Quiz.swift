//
//  Quiz.swift
//  Kahoot Hackathon
//
//  Created by Ang Jun Ray on 5/6/21.
//

import Foundation

struct Questions{
    var question: String
    var options: [String]
    var correct: Int
    
    init(title: String, options: [String], correct: Int) {
        self.question = title
        self.options = options
        self.correct = correct
    }
}

struct Quiz{
    var score:Int
    var questions:[Questions]
    var currentQuestion:Int
    var quizFinished:Bool
    
    init(questions: [Questions]){
        self.questions = questions
        self.score = 0
        self.currentQuestion = 0
        self.quizFinished = false
    }
}
