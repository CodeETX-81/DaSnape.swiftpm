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
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    enum SnakeDirections{
        case up
        case down
        case right
        case left
    }
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 25, height: 25)
                .position(SnakeHead)
                .foregroundColor(.red)
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
        //.frame(width: 500, height: 750)
        .padding()
        .background(.cyan)
        .onReceive(timer) { time in
            UpdateSnakePosition()
        }
    }
        


    func UpdateSnakePosition() {
        switch SnakeDirection{
        case .up:do {
            SnakeHead.y -= 25
        }
        case .down:do {
            SnakeHead.y += 25

        }
        case .left:do {
            SnakeHead.x -= 25

        }
        case .right:do {
            SnakeHead.x += 25

        }

        }
    }
}



struct GamePlay_Previews: PreviewProvider {
    static var previews: some View {
        GamePlay(SnakeDirection: .up)
    }
}
