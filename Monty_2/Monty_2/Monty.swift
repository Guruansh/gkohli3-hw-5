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
    }
}
