//
//  GamePlay.swift
//  DaSnape
//
//  Created by Nazar Kochylo on 4/24/23.
//

import SwiftUI

struct GamePlay: View {
    @State var SnakePositionX = 0
    @State var SnakePositionY = 0
    @State var SnakeUp = false
    @State var SnakeDown = false
    @State var SnakeRight = false
    @State var SnakeLeft = false
    
    var body: some View {
        HStack {
            Button {
                SnakeUp.toggle()
            } label: {
                Image(systemName: "arrowtriangle.up.square.fill")
            }
            Button {
                SnakeDown.toggle()
            } label: {
                Image(systemName: "arrowtriangle.down.square.fill")
            }
            Button {
                SnakeLeft.toggle()
            } label: {
                Image(systemName: "arrowtriangle.backward.square.fill")
            }
            Button {
                SnakeRight.toggle()
            } label: {
                Image(systemName: "arrowtriangle.forward.square.fill")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
    }
}

struct GamePlay_Previews: PreviewProvider {
    static var previews: some View {
        GamePlay()
    }
}
