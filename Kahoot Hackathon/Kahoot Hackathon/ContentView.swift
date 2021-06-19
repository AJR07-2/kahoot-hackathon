//
//  ContentView.swift
//  Kahoot Hackathon
//
//  Created by Ang Jun Ray on 5/6/21.
//

import SwiftUI

struct ContentView: View {
    @State var quiz = Quiz(questions:
                            [Questions(title: "How many jars of Nutella can YJ eat?", options: ["10 Jars", "15 Jars", "20 Jars", "100 Jars"], correct: 3),
                             Questions(title: "How many times has Chew Caven not submited the attendence form?", options: ["5 times", "8 times" , "10 times", "11 times"], correct: 1),
                             Questions(title: "Which is the best language?", options: ["Python","UIKit", "SwiftUI", "C++"], correct: 2),
                             Questions(title: "When does WWDC21 start", options: ["Friday 12:00am", "Sunday 1:00am", "Friday 1:00pm", "Monday 1:00am"], correct: 3)
                            ])
    
    @State private var showingCorrect = false
    @State private var showingWrong = false
    let colourChoice = [Color.red, Color.yellow, Color.orange, Color.green, Color.purple]
    let symbolChoice = ["square.fill", "circle.fill", "triangle.fill", "diamond.fill"]
    
    var body: some View {
        let currentQuestion = generateCurrentQuestion(quiz: quiz)
        
        VStack{
            if(!quiz.quizFinished){ //if quiz is not finished
                Text(currentQuestion.question)
                    .padding()
                    .font(.system(size: 30, weight: .heavy, design: .default))
                
                VStack(alignment: .center, spacing: 10, content: {
                    ForEach(quiz.questions[quiz.currentQuestion].options, id: \.self){ optionArray in
                        
                        HStack{
                            ForEach(optionArray, id: \.self){ option in
                                Button(action: {
                                    //show sheet accordingly
                                    if(option == currentQuestion.options[currentQuestion.correct/2][currentQuestion.correct%2]){
                                        showingCorrect = true
                                        showingWrong = false
                                        quiz.score += 1
                                    } else{
                                        showingWrong = true
                                        showingCorrect = false
                                    }
                                    
                                    //increment the current question number
                                    quiz.currentQuestion += 1
                                    if(quiz.currentQuestion == quiz.questions.count){
                                        //quiz is over
                                        quiz.quizFinished = true
                                    }
                                }){
                                    Label(
                                        title: { Text(option) },
                                        icon: { Image(systemName: symbolChoice[Int.random(in: 0..<4)])}
                                    )}
                                .foregroundColor(.black)
                                .frame(width: 175, height: 125, alignment: .center)
                                .font(.title)
                                .background(colourChoice[Int.random(in: 0..<5)])
                                .sheet(isPresented: $showingCorrect) {
                                    ResultSheet(correct: true)
                                }
                                .sheet(isPresented: $showingWrong) {
                                    ResultSheet(correct: false)
                                }
                            }
                        }
                    }
                })
            } else {
                Image("party")
                    .resizable()
                    .frame(width: 400, height: 400)
                    .animation(.easeInOut(duration: 3000))
                Text("Your score is \(quiz.score)")
                
                Button(action: {
                    quiz.quizFinished = false
                    quiz.currentQuestion = 0
                    showingWrong = false
                    showingCorrect = false
                }, label: {
                    Text("Retry")
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func generateCurrentQuestion(quiz: Quiz) -> Questions{
    var currentQuestion = Questions(title: "", options: [""], correct: 0)
    if(quiz.currentQuestion != quiz.questions.count){
        currentQuestion = quiz.questions[quiz.currentQuestion]
    }
    return currentQuestion
}
