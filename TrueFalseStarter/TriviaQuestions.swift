//
//  TriviaQuestions.swift
//  TrueFalseStarter
//
//  Created by Gerardo Zayas on 6/23/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

struct TriviaQuestions {
    // Struct sets up question, answer options, and correct answer constants
    let question: String
    let options: [Int: String]
    let answer:   Int
}

// Array to collect all questions.

var questions: [TriviaQuestions] = [
    TriviaQuestions(question: "What superhero grew up on the planet Tamaran?",
                    options: [1: "Ultra Boy",
                              2: "The Silver Surfer",
                              3: "Starfire",
                              4: "Hawkgirl"],
                    answer: 3),
    TriviaQuestions(question: "Edwin Jarvis serves as butler to what superteam?",
                    options: [1: "Avengers",
                              2: "Fantastic Four",
                              3: "Justice League",
                              4: "Teen Titans"],
                    answer: 1),
    TriviaQuestions(question: "Who was the first costumed superhero?",
                    options: [1: "The Phantom",
                              2: "Superman",
                              3: "Arrow",
                              4: "Crimson Avenger"],
                    answer: 1),
    TriviaQuestions(question: "What year was the first modern comic book printed?",
                    options: [1: "1938",
                              2: "1933",
                              3: "1925",
                              4: "1917"],
                    answer: 2),
    TriviaQuestions(question: "Who created the Vision?",
                    options: [1: "Ultron",
                              2: "Hank Pym",
                              3: "Tony Stark",
                              4: "Reed Richards"],
                    answer: 1),
    TriviaQuestions(question: "Who is Bruce Banner's cousin?",
                    options: [1: "Carol Danvers",
                              2: "Greer Nelson",
                              3: "Jessica Drew",
                              4: "Jennifer Walters"],
                    answer: 4),
    TriviaQuestions(question: "What was first introduced in Detective Comics #29?",
                    options: [1: "The Batarang",
                              2: "Batman's Utility Belt",
                              3: "Robin",
                              4: "The Batmobile"],
                    answer: 2),
    TriviaQuestions(question: "What artist penciled the first appearance of Beta Ray Bill?",
                    options: [1: "John Byrne",
                              2: "Bill Sienkiewicz",
                              3: "Todd McFarlane",
                              4: "Walt Simonson"],
                    answer: 4),
    TriviaQuestions(question: "In Son of Superman, who is Superman's son?",
                    options: [1: "Jim Kent",
                              2: "Jon Kent",
                              3: "Jak Kent",
                              4: "Jud Kent"],
                    answer: 2),
    TriviaQuestions(question: "What superhero was born with the Curse of Kordax?",
                    options: [1: "Hawkman",
                              2: "Aquaman",
                              3: "Ghost Rider",
                              4: "Captain Marvel"],
                    answer: 2),
    TriviaQuestions(question: "What superhero gained his powers after being exposed to the Orb of Ra?",
                    options: [1: "Metamorpho",
                              2: "Hawkman",
                              3: "Suicide Squad",
                              4: "Iron Fist"],
                    answer: 1),
    TriviaQuestions(question: "Which of the following heroes was NOT a member of the magically powerd Sentinels of Magic?",
                    options: [1: "Doctor Strange",
                              2: "Zatanna",
                              3: "Doctor Fate",
                              4: "Raven"],
                    answer: 1),
    TriviaQuestions(question: "Which Green Lantern came first?",
                    options: [1: "John Stewart",
                              2: "Alan Scott",
                              3: "Hal Jordan",
                              4: "Guy Gardner"],
                    answer: 2),
    TriviaQuestions(question: "Who is the Scarlet Witch's twin brother?",
                    options: [1: "Wonder Man",
                              2: "Magneto",
                              3: "Doctor Strange",
                              4: "Quicksilver"],
                    answer: 4),
    TriviaQuestions(question: "What character teamed up with a different hero in almost every issue of The Brave and the Bold?",
                    options: [1: "Superman",
                              2: "Spider-Man",
                              3: "Batman",
                              4: "Captain America"],
                    answer: 3),
    TriviaQuestions(question: "What member of the Inhumans did Johnny Storm date?",
                    options: [1: "Medusa",
                              2: "Luna Maximoff",
                              3: "Crystal",
                              4: "Sapphiras"],
                    answer: 3),
    TriviaQuestions(question: "What is the best-selling comic book of all time?",
                    options: [1: "Batman #428",
                              2: "Superman #75",
                              3: "Amazing Spider-Man #583",
                              4: "X-Men #1"],
                    answer: 4),
    TriviaQuestions(question: "Who is Plastic Man's sidekick?",
                    options: [1: "Dum Dum Dugan",
                              2: "Gummy Boy",
                              3: "Bucky Barnes",
                              4: "Woozy Winks"],
                    answer: 4),
    TriviaQuestions(question: "What color was the Hulk when he was originally introduced?",
                    options: [1: "Purple",
                              2: "Red",
                              3: "Grey",
                              4: "Green"],
                    answer: 3)
]

// generates question and assigns it a number to be indexed
var questionsToIndex = [Int]()

var indexOfQuestions: Int = 0

func generateQuestionsToIndex() {
    var numberOfQuestions: Int = 0
    
    while numberOfQuestions < questions.count {
        questionsToIndex.append(numberOfQuestions)
        numberOfQuestions += 1
    }
}

// Selects a questions to index and removes it temporarily from the index
func selectNextQuestion() {
    indexOfQuestions = questionsToIndex.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: questionsToIndex.count))
}








