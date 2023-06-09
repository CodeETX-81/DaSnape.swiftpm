import SwiftUI

struct GamePlay: View {
    @Environment(\.dismiss) private var dismiss
    @State var SnakeDirection:SnakeDirections
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    @State var paused = false
    @State var gameOver = false
    @Binding var SnakeColor:Color
    @State var timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
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
                Text("\(snakePositions.count - 5)")
                                .font(Font.custom(
                                    "Times New Roman", size: 175))
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
                print(screenWidth)
                print(screenHeight)
            }
            ZStack {
                Button {
                    if SnakeDirection != .down{
                        SnakeDirection = .up
                        updateSnakeSize()}
                    else {}
                } label: {
                    Image(systemName: "arrowtriangle.up.square.fill")
                }.scaleEffect(7)
                    .offset(y: -230)
                    .opacity(0.8)
                Button {
                    if SnakeDirection != .up{
                        SnakeDirection = .down}
                    else {}
                } label: {
                    Image(systemName: "arrowtriangle.down.square.fill")
                }.scaleEffect(7)
                    .offset(y: -80)
                    .opacity(0.8)
                Button {
                    if SnakeDirection != .right{
                        SnakeDirection = .left}
                    else {}
                } label: {
                    Image(systemName: "arrowtriangle.backward.square.fill")
                }.scaleEffect(7)
                    .offset(x: -150, y: -80)
                    .opacity(0.8)
                Button {
                    if SnakeDirection != .left{
                        SnakeDirection = .right}
                    else {}
                } label: {
                    Image(systemName: "arrowtriangle.forward.square.fill")
                }.scaleEffect(7)
                    .offset(x: 150, y:-80)
                    .opacity(0.8)
            }
        }  .alert(isPresented: $gameOver) {
            Alert(title: Text("You Died"), message: Text(" you hit the wall"), dismissButton: .default(Text("Restart"), action: {
                snakePositions = [CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150), CGPoint(x: 150, y: 150)]
                timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
                paused = false
            }))
        }
        .background(.blue)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Back")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 39)
                        .background(.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .opacity(0.8)
                }
            }
            ToolbarItem {
                Button {
                    if paused == false {
                        timer.upstream.connect().cancel()
                    }
                    
                    else if paused == true {
                        timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
                    }
                    paused.toggle()
                    
                    
                } label: {
                    
                    if paused == false {
                        Text("Pause")
                            .frame(width: 100, height: 39)
                            .background(.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .opacity(0.8)

                    }
                    
                    else if paused == true {
                        Text("Play")
                            .frame(width: 100, height: 39)
                            .background(.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .opacity(0.8)
                    }
                }
                .foregroundColor(.white)
            }
            
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
        if snakePositions[0].x >= screenWidth || snakePositions[0].x <= 0  || snakePositions[0].y >= screenHeight - 25 || snakePositions[0].y <= 0 {
            gameOver = true
            print(gameOver)
            timer.upstream.connect().cancel()
            paused = true
            
        }
    }
    func updateSnakeSize(){
        if self.snakePositions[0] == self.foodPosition{
            self.snakePositions.append(self.snakePositions[0])
            let randomX = Int(Int.random(in: 25...Int(screenWidth))/25) * 25
            print(randomX)
            let randomY = Int(Int.random(in: 25...Int(screenHeight))/25) * 25
            print(randomY)
            foodPosition = CGPoint(x: randomX, y: randomY)
        }
    }
}

