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
                
                // new game button
                Button("New Game") {
                    monty.newGame()
                }
                .font(.system(size: 24, weight: .bold))
                .padding(.horizontal, 40)
                .padding(.vertical, 10)
                .foregroundColor(.black)
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
