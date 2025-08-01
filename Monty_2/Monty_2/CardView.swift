//
//  CardView.swift
//  Monty_2
//
//  Created by Guruansh  Kohli  on 8/1/25

//CardView

import SwiftUI

struct CardView: View {
    
    let isFaceUp: Bool
    let contentImageName: String

    var body: some View {
        ZStack {
            // card back
            Image("card_back")
                .resizable()
                .scaledToFit()
                .opacity(isFaceUp ? 0 : 1)
                .rotation3DEffect(
                    .degrees(isFaceUp ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )

            // card front
            Image(contentImageName)
                .resizable()
                .scaledToFit()
                .opacity(isFaceUp ? 1 : 0)
                .rotation3DEffect(
                    .degrees(isFaceUp ? 0 : -180),
                    axis: (x: 0, y: 1, z: 0)
                )
        }
        // flip animation
        .animation(.easeInOut(duration: 0.5), value: isFaceUp)
    }
}
