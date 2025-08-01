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
    @State private var areCardsDealt = false

    var body: some View {
        ZStack{
            Color.green.edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                
                // displaying winner or loser image
                Image(monty.playerWins ? "winner_image" : "loser_image")
                    .resizable()
                    .scaledToFit()
                    .offset(y: monty.gameOver ? 0 : -200)
                        .opacity(monty.gameOver ? 1 : 0)
                        // winner loser animation
                        .animation(.spring(response: 0.5, dampingFraction: 0.7), value: monty.gameOver)
                
                // 3 cards animated in a zstack
                ZStack {
                    ForEach(0..<3, id: \.self) { i in
                        let isFaceUp = monty.cardStates[i] == .faceUp
                        let faceName = i == monty.aceIndex ? "card_ace" : "card_blank"
                        CardView(
                            isFaceUp: isFaceUp,
                            contentImageName: isFaceUp ? faceName : "card_ace"
                        )
                        .frame(width: 100, height: 150)
                        .offset(x: areCardsDealt ? (-120 + CGFloat(i) * 120) : 0)
                        // animate whenever areCardsDealt toggles
                        .animation(.easeInOut(duration: 0.5), value: areCardsDealt)
                        .allowsHitTesting(areCardsDealt)
                        .onTapGesture {
                            monty.onCardTap(at: i)
                        }
                    }
                }
                
                // Creating Control Strip
                HStack(spacing: 30) {
                    
                    // Player and House scores
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
                        withAnimation(.easeInOut(duration: 0.5)){
                            areCardsDealt = false
                        }
                    }
                    .font(.system(size: 20, weight: .semibold))
                    .disabled(!monty.gameOver)

                    // New Game button
                    Button("New Game") {
                        monty.newGame()
                        withAnimation(.easeInOut(duration: 0.5)){
                            areCardsDealt = true
                        }
                    }
                    .font(.system(size: 20, weight: .semibold))
                    // disable button on gameover and when new game starts 
                    .disabled(monty.gameOver || areCardsDealt)

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
