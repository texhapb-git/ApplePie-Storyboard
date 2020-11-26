//
//  Game.swift
//  ApplePie Storyboard
//
//  Created by Максим Иванов on 25.11.2020.
//

struct Game {
    var guessWord: String
    var incorrectMovesRemaining: Int
    fileprivate var chosedLetters: [Character] = []
    
    init(guessWord: String, incorrectMovesRemaining: Int) {
        self.guessWord = guessWord
        self.incorrectMovesRemaining = incorrectMovesRemaining
    }
    
    var currentWord: String {
        
        var wordToShow: String = ""
        
        for letter in guessWord {
            
            if chosedLetters.contains(Character(letter.lowercased())) || letter == "-" || letter == " " {
                wordToShow += String(letter)
            } else {
                wordToShow += "_"
            }
            
        }
        
        return wordToShow
    }
    
    
    mutating func playerChoose(letter: Character) {
        
        let lowercasedLetter = Character(letter.lowercased())
        chosedLetters.append(lowercasedLetter)
        
        if !guessWord.lowercased().contains(lowercasedLetter) {
            incorrectMovesRemaining -= 1
        }
        
        
    }
}
