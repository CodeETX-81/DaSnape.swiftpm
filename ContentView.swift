import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            NavigationView {
                VStack{
                    Image("snake")
                    NavigationLink {
                        GamePlay(SnakeDirection: .up)
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
                            Text("Acheievement")
                                .foregroundColor(.black)
                                .font(Font.custom(
                                    "Times New Roman", size: 49))
                        }
                    }
                    NavigationLink {
                        Settings()
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
                }
//                .background(Snake()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .aspectRatio(contentMode: .fill)
//                                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
//                                    .edgesIgnoringSafeArea(.all)
//                            )
            }.navigationViewStyle(.stack)
        }
    }
}
