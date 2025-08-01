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
            // Bottom card face
            Image(contentImageName)
                .resizable()
                .scaledToFit()

            Image("card_back")
                .resizable()
                .scaledToFit()
                .opacity(isFaceUp ? 0 : 1)
        }
    }
}
