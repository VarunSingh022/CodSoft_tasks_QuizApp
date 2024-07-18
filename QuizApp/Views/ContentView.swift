//
//  ContentView.swift
//  QuizApp
//
//  Created by Varun Kumar Singh on 18/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var quizmanager = QuizManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Quiz Game")
                        .lilacTitle()
                    
                    Text("Are you ready to test out your Academic skills?")
                        .foregroundColor(Color("AccentColor"))
                }
                
                NavigationLink {
                    QuizView()
                        .environmentObject(quizmanager)
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(.brown)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
