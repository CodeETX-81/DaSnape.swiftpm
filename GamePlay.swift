import SwiftUI

struct GamePlay: View {
    @State var SnakeDirection:SnakeDirections
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    @State var gameOver = false
    @Binding var SnakeColor:Color
    let timer = Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()
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
        ZStack {
                Button {
                    if SnakeDirection != .down{
                        SnakeDirection = .up
                        updateSnakeSize()}
                    else {}
                } label: {
                    Image(systemName: "arrowtriangle.up.square.fill")
                }.scaleEffect(4.5)
                .offset(y: -70)
                .opacity(0.7)
                Button {
                    if SnakeDirection != .up{
                        SnakeDirection = .down}
                    else {}
                } label: {
                    Image(systemName: "arrowtriangle.down.square.fill")
                }.scaleEffect(4.5)
                    .offset()
                    .opacity(0.7)
                Button {
                    if SnakeDirection != .right{
                        SnakeDirection = .left}
                    else {}
                } label: {
                    Image(systemName: "arrowtriangle.backward.square.fill")
                }.scaleEffect(4.5)
                .offset(x: -70)
                .opacity(0.7)
                Button {
                    if SnakeDirection != .left{
                        SnakeDirection = .right}
                    else {}
                } label: {
                    Image(systemName: "arrowtriangle.forward.square.fill")
                }.scaleEffect(4.5)
                .offset(x: 70)
                .opacity(0.7)
            }
        }  .alert(isPresented: $gameOver) {
            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("Restart"), action: {
            snakePositions = [CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150)]
            }))
        }
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
        if snakePositions[0].x >= screenWidth || snakePositions[0].x <= 0 || snakePositions[0].y >= screenHeight || snakePositions[0].y <= 0 {
            gameOver = true
            print(gameOver)
        }
    }
    func updateSnakeSize(){
        if self.snakePositions[0] == self.foodPosition{
            self.snakePositions.append(self.snakePositions[0])
            let randomX = Int(Int.random(in: 0...Int(screenWidth-25))/25) * 25
            print(randomX)
            let randomY = Int(Int.random(in: 0...Int(screenHeight-25))/25) * 25
            print(randomY)
            foodPosition = CGPoint(x: randomX, y: randomY)
        }
    }
}

