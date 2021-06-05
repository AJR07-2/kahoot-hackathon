//
//  WrongSheet.swift
//  Kahoot Hackathon
//
//  Created by Ang Jun Ray on 5/6/21.
//

import SwiftUI

struct ResultSheet: View {
    var correct:Bool
    
    var body: some View {
        VStack{
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
