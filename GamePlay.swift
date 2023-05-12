import SwiftUI

struct GamePlay: View {
    @State var SnakeDirection:SnakeDirections
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    @Binding var SnakeColor:Color 
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State var snakePositions: [CGPoint] = [CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150)]
    @State var foodPosition: CGPoint = CGPoint(x: 200, y: 200)
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
                        .foregroundColor(SnakeColor)
                }
                Rectangle()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.red)
                    .position(foodPosition)
            }
            .onReceive(timer) { time in
                updateSnakeSize()
                updateSnakePosition()
            }
            HStack {
                Button {
                    SnakeDirection = .up
                    updateSnakeSize()
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
        Image("green-checkerboard")
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
        func updateSnakeSize(){
            if self.snakePositions[0] == self.foodPosition{
                self.snakePositions.append(self.snakePositions[0])
                var randomX = Int(Int.random(in: 0...Int(screenWidth))/25) * 25
                print(randomX)
                var randomY = Int(Int.random(in: 0...Int(screenHeight))/25) * 25
                print(randomY)
                foodPosition = CGPoint(x: randomX, y: randomY)
            }
        }
}

