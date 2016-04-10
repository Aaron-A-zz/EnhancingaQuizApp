//
//  Questions.swift
//  EnhancingaQuizApp
//
//  Created by Aaron on 4/9/16.
//  Copyright © 2016 Aaron Ackerman. All rights reserved.
//

import Foundation
import GameKit

struct options {
    
    var optionOne: String?
    var optionTwo: String?
    var optionThree: String?
    var optionFour: String?
    
}

class Questions {
    let question: String
    let answer: String
    let option: options
    
    init(question: String, answer: String, option: options) {
        self.question = question
        self.answer = answer
        self.option = option
    }
}


let firstQuestion = Questions(question: "Which is app uses CryptoJS?", answer: "Invisible Ink", option: options(optionOne: "Angry Birds", optionTwo: "Invisible Ink", optionThree: "Clash of Clans", optionFour: "None"))
let secondQuestion = Questions(question: "Black Sails LLC created !nvisible Ink ", answer: "True", option: options(optionOne: "True", optionTwo: "False", optionThree: "", optionFour: ""))

let thirdQuestion = Questions(question: "What game was not created by SuperCell.", answer: "Farmville", option: options(optionOne: "Clash Royale", optionTwo: "Clash of Clans", optionThree: "Hay Day", optionFour: "Farmville"))

let forthQuestion = Questions(question: "In Clash of Clans, how many members can you have per clan?", answer: "50", option: options(optionOne: "20", optionTwo: "40", optionThree: "50", optionFour: ""))

let fifthQuestion = Questions(question: "How many courses does Treehouse offer?", answer: "222", option: options(optionOne: "505", optionTwo: "600", optionThree: "222", optionFour: "434"))

let sixthQuestion = Questions(question: "Ryan Carson is the __________ of Team Treehouse.", answer: "CEO", option: options(optionOne: "CFO", optionTwo: "CPO", optionThree: "CEO", optionFour: ""))

let seventhQuestion = Questions(question: "Who has more iOS points at Team Treehouse?", answer: "Stone Preston", option: options(optionOne: "Aaron Ackerman", optionTwo: "CJ Marchione", optionThree: "Stone Preston", optionFour: "Jason Anders"))

let eighthQuestion = Questions(question: "When was Treehouse founded?", answer: "2011", option: options(optionOne: "2010", optionTwo: "2012", optionThree: "2011", optionFour: "2009"))

let ninethQuestion = Questions(question: "When was Angry Birds created?", answer: "December 11, 2009", option: options(optionOne: "December 11, 2009", optionTwo: "January 5, 2006", optionThree: "February 13 2009", optionFour: ""))


let questionArray = [firstQuestion,secondQuestion,thirdQuestion,forthQuestion,fifthQuestion,sixthQuestion,seventhQuestion,eighthQuestion,ninethQuestion]
