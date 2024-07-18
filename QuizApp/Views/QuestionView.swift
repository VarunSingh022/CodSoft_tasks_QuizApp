//
//  QuestionView.swift
//  QuizApp
//
//  Created by Varun Kumar Singh on 18/07/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizmanager: QuizManager

    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Quiz Game")
                    .lilacTitle()
                
                Spacer()
                
                Text("\(quizmanager.index + 1) out of \(quizmanager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: quizmanager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(quizmanager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                ForEach(quizmanager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(quizmanager)
                }
            }
            
            Button {
                quizmanager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: quizmanager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!quizmanager.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.cyan)
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(QuizManager())
    }
}
