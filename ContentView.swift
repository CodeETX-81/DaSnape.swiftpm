import SwiftUI

struct ContentView: View {
    @State var SnakeColor:Color = Color.orange
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack{
            NavigationView {
                VStack{
                    Image("snake")
                    NavigationLink {
                        GamePlay(SnakeDirection: .right, SnakeColor: $SnakeColor)
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 300, height: 100)
                            Text("Play")
                                .foregroundColor(.black)
                                .font(Font.custom(
                                    "Times New Roman", size: 79))
                        }
                    }
                    NavigationLink {
                        Achievements()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 300, height: 100)
                            Text("Achievement")
                                .foregroundColor(.black)
                                .font(Font.custom(
                                    "Times New Roman", size: 49))
                        }
                    }
                    NavigationLink {
                        Settings(SnakeColor: $SnakeColor)
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 300, height: 100)
                            Text("Settings")
                                .foregroundColor(.black)
                                .font(Font.custom(
                                    "Times New Roman", size: 49))
                        }
                    }
                }.scaleEffect((screenWidth/575))
            }.navigationViewStyle(.stack)
        }
    }
}
