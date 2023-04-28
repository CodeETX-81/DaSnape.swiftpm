//
//  GamePlay.swift
//  DaSnape
//
//  Created by Nazar Kochylo on 4/24/23.
//

//import SwiftUI
//
//struct GamePlay: View {
//    @State var SnakeHead:CGPoint = (CGPoint(x: 0, y: 0))
//    @State var SnakeDirection:SnakeDirections
//    enum SnakeDirections{
//        case up
//        case down
//        case right
//        case left
//    }
//
//    var body: some View {
//        HStack {
//            Button {
//                SnakeDirection = .up
//                UpdateSnakePosition()
//            } label: {
//                Image(systemName: "arrowtriangle.up.square.fill")
//            }
//            Button {
//                //SnakeDown.toggle()
//            } label: {
//                Image(systemName: "arrowtriangle.down.square.fill")
//            }
//            Button {
//                //SnakeLeft.toggle()
//            } label: {
//                Image(systemName: "arrowtriangle.backward.square.fill")
//            }
//            Button {
//                //SnakeRight.toggle()
//            } label: {
//                Image(systemName: "arrowtriangle.forward.square.fill")
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.cyan)
//    }
//
//
//    func UpdateSnakePosition() {
//        switch SnakeDirection{
//        case .up :do {
//            SnakeHead.y += 1
//        }
//        case .down:do {
//            SnakeHead.y -= 1
//
//        }
//        case .left:do {
//            SnakeHead.x -= 1
//
//        }
//        case .right:do {
//            SnakeHead.x += 1
//
//        }
//
//        }
//
//
//
//
//    }
//}
//
//
//
//struct GamePlay_Previews: PreviewProvider {
//    static var previews: some View {
//        GamePlay(SnakeDirection: .up)
//    }
//}
