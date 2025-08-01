//
//  ContentView.swift
//  Monty_2
//
//  Created by Guruansh  Kohli  on 8/1/25.
//
// ContentView

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var monty: Monty

    var body: some View {
        ZStack{
            Color.green.edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                
                // displaying winner or loser image
                Image(monty.playerWins ? "winner_image" : "loser_image")
                    .resizable()
                    .scaledToFit()
                    .opacity(monty.gameOver ? 1 : 0)
                    .animation(.easeIn, value: monty.gameOver)
                
                // 3 cards face down in an Hstack
                HStack(spacing: 20) {
                    ForEach(0..<3, id: \.self) { i in
                        let isFaceUp = monty.cardStates[i] == .faceUp
                        let faceName = i == monty.aceIndex ? "card_ace" : "card_blank"
                        CardView(
                            isFaceUp: isFaceUp,
                            contentImageName: isFaceUp ? faceName : "card_ace"
                        )
                        .frame(width: 100, height: 150)
                        .onTapGesture {
                            monty.onCardTap(at: i)
                        }
                    }
                }
                
                // Creating Control Strip
                HStack(spacing: 30) {
                    
                    // Player & House scores
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Player: \(monty.playerPoints)")
                            .font(.headline)
                        Text("House:  \(monty.housePoints)")
                            .font(.headline)
                    }

                    Spacer()

                    // Reset button
                    Button("Reset") {
                        monty.resetRound()
                    }
                    .font(.system(size: 20, weight: .semibold))
                    .disabled(!monty.gameOver)

                    // New Game button
                    Button("New Game") {
                        monty.newGame()
                    }
                    .font(.system(size: 20, weight: .semibold))
                    .disabled(monty.gameOver)

                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background(Color.white.opacity(0.2))
                .cornerRadius(12)

            }
            .padding()
                
        }
    }
}


//debug
#Preview {
    ContentView()
        .environmentObject(Monty())
}
