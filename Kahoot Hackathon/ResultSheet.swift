//
//  WrongSheet.swift
//  Kahoot Hackathon
//
//  Created by Ang Jun Ray on 5/6/21.
//

import SwiftUI

struct ResultSheet: View {
    var correct:Bool
    var progress: Double
    
    var body: some View {
        VStack{
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(Color.red)
                    .frame(width: 150, height: 150)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(progress))
                    .stroke(style: .init(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.red)
                    .rotationEffect(Angle(degrees: 270.0))
                    .frame(width: 150, height: 150)
            }
            
            if correct{
                Image("correct")
                    .resizable()
                    .frame(width: 400, height: 400)
                Text("You got it right!")
            } else {
                Image("wrong")
                    .resizable()
                    .frame(width: 400, height: 400)
                Text("Nope that's wrong")
            }
        }
    }
}

struct ResultSheet_Previews: PreviewProvider {
    static var previews: some View {
        ResultSheet(correct: true)
        ResultSheet(correct: false)
    }
}
