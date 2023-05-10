import SwiftUI

struct GamePlay: View {
    @State var SnakeDirection:SnakeDirections
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State var snakePositions: [CGPoint] = [CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150)]
    @State var foodPosition: CGPoint = CGPoint(x: 500, y: 500)
    enum SnakeDirections{
        case up
        case down
        case right
        case left
    }
    var body: some View {
        VStack{
            ZStack {
                ForEach(0..<snakePositions.count, id:\.self) { index in
                    Rectangle()
                        .frame(width: 25, height: 25)
                        .position(self.snakePositions[index])
                        .foregroundColor(.red)
                }
                Rectangle()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.red)
                    .position(foodPosition)
            }
            .onReceive(timer) { time in
                
                updateSnakePosition()
            }
            HStack {
                Button {
                    SnakeDirection = .up
                } label: {
                    Image(systemName: "arrowtriangle.up.square.fill")
                }
                Button {
                    SnakeDirection = .down
                } label: {
                    Image(systemName: "arrowtriangle.down.square.fill")
                }
                Button {
                    SnakeDirection = .left
                } label: {
                    Image(systemName: "arrowtriangle.backward.square.fill")
                }
                Button {
                    SnakeDirection = .right
                } label: {
                    Image(systemName: "arrowtriangle.forward.square.fill")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(.cyan)
    }
        


    func updateSnakePosition() {
        var previousSnakePosition = snakePositions[0]
            switch SnakeDirection{
            case .up:
                self.snakePositions[0].y -= 25
            case .down: 
                self.snakePositions[0].y += 25
            case .left:
                self.snakePositions[0].x -= 25
            case .right: 
                self.snakePositions[0].x += 25
                
                
            }
        for index in 1..<snakePositions.count{
            let currentSnakePostion = snakePositions[index]
            snakePositions[index] = previousSnakePosition
            previousSnakePosition = currentSnakePostion
        }
    }

}



struct GamePlay_Previews: PreviewProvider {
    static var previews: some View {
        GamePlay(SnakeDirection: .up)
    }
}
