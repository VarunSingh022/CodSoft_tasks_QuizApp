//
//  Answer.swift
//  QuizApp
//
//  Created by Varun Kumar Singh on 18/07/24.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID() // Setting the UUID ourselves inside of the model, because API doesn't return a unique ID for each answer
    var text: AttributedString
    var isCorrect: Bool
}
