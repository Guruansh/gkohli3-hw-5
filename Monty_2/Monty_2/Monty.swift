//
//  Monty.swift
//  Monty_2
//
//  Created by Guruansh  Kohli  on 8/1/25.
//
//Monty

import Foundation
import Combine

// state for each card
enum CardState {
    case faceDown
    case faceUp
}

// Monty game logic
class Monty: ObservableObject {
    
    // to track scores
    @Published var playerPoints = 0
    @Published var housePoints = 0

    @Published var cardStates: [CardState] = [.faceDown, .faceDown, .faceDown]
    @Published var gameOver = false
    @Published var playerWins = false

    var aceIndex = 0

    init() {
        newGame()
    }

    // Reset everything
    func newGame() {
        aceIndex = Int.random(in: 0..<3)
        cardStates = [.faceDown, .faceDown, .faceDown]
        gameOver = false
        playerWins = false
    }

    // reveals card on tap
    func onCardTap(at index: Int) {
        guard !gameOver else { return }
        gameOver = true
        playerWins = (index == aceIndex)
        cardStates[index] = .faceUp
        
        // Awarding 3 points
                if playerWins {
                    playerPoints += 3
                } else {
                    housePoints += 3
                }
    }
    
    // Resting the game
        func resetRound() {
            cardStates = [.faceDown, .faceDown, .faceDown]
            gameOver = false
            playerWins = false
        }
}
