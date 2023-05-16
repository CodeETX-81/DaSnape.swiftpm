import SwiftUI

struct Settings: View {
    @Binding var SnakeColor:Color
    @State var background:Color = Color.orange
    var body: some View {
        VStack{
            Text("Snake Color")
            Button("Green"){
                SnakeColor = .green
            }
            
            Button("Blue"){
                SnakeColor = .blue
            }
            
            Button("Red"){
                SnakeColor = .red
            }
            
            Button("Purple"){
                SnakeColor = .purple
            }
            
            Button("White"){
                SnakeColor = .white
            }
            
            Button("Black"){
                SnakeColor = .black
            }
        }
    }
}
