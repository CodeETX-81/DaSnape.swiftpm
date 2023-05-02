//
//  GamePlay.swift
//  DaSnape
//
//  Created by Nazar Kochylo on 4/24/23.
//

import SwiftUI

struct GamePlay: View {
    @State var SnakeHead:CGPoint = (CGPoint(x: 100, y: 100))
    @State var SnakeDirection:SnakeDirections
    enum SnakeDirections{
        case up
        case down
        case right
        case left
    }
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 10, height: 10)
                .position(SnakeHead)
                .foregroundColor(.green)
            HStack {
                Button {
                    SnakeDirection = .up
                    UpdateSnakePosition()
                } label: {
                    Image(systemName: "arrowtriangle.up.square.fill")
                }
                Button {
                    SnakeDirection = .down
                    UpdateSnakePosition()
                } label: {
                    Image(systemName: "arrowtriangle.down.square.fill")
                }
                Button {
                    SnakeDirection = .left
                    UpdateSnakePosition()
                } label: {
                    Image(systemName: "arrowtriangle.backward.square.fill")
                }
                Button {
                    SnakeDirection = .right
                    UpdateSnakePosition()
                } label: {
                    Image(systemName: "arrowtriangle.forward.square.fill")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
    }


    func UpdateSnakePosition() {
        switch SnakeDirection{
        case .up :do {
            SnakeHead.y -= 10
        }
        case .down:do {
            SnakeHead.y += 10

        }
        case .left:do {
            SnakeHead.x -= 10

        }
        case .right:do {
            SnakeHead.x += 10

        }

        }




    }
}



struct GamePlay_Previews: PreviewProvider {
    static var previews: some View {
        GamePlay(SnakeDirection: .up)
    }
}
