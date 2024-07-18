//
//  QuizView.swift
//  QuizApp
//
//  Created by Varun Kumar Singh on 18/07/24.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject var quizmanager: QuizManager

    var body: some View {
        if quizmanager.reachedEnd {
            VStack(spacing: 20) {
                Text("Quiz Game")
                    .lilacTitle()

                Text("Congratulations, you completed the Quiz! 🥳")
                
                Text("You scored \(quizmanager.score) out of \(quizmanager.length)")
                
                Button {
                    Task.init {
                        await quizmanager.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.orange)
        } else {
            QuestionView()
                .environmentObject(quizmanager)
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(QuizManager())
    }
}
