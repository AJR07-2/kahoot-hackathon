//
//  Quiz.swift
//  Kahoot Hackathon
//
//  Created by Ang Jun Ray on 5/6/21.
//

import Foundation

struct Questions{
    var question: String
    var options: [[String]] = []
    var correct: Int
    
    init(title: String, options: [String], correct: Int) {
        self.question = title
        self.correct = correct
        
        //sort the questions out properly so that the display can display it correctly
        for n in 0..<options.count{
            if(n % 2 == 1){
                self.options.append([options[n-1], options[n]])
            }
        }
        if(options.count % 2 == 1){
            self.options.append([options[options.count - 1]])
        }
    }
}

struct Quiz{
    var score:Int
    var questions:[Questions]
    var currentQuestion:Int
    var quizFinished:Bool
    
    init(questions: [Questions]){
        self.score = 0
        self.currentQuestion = 0
        self.quizFinished = false
        self.questions = questions
    }
}
