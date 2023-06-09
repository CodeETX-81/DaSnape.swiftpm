import SwiftUI

struct Settings: View {
    @Binding var SnakeColor:Color
    @State var background:Color = Color.orange
    var body: some View {
        ZStack{
            Color.blue
                .font(.largeTitle)
                .ignoresSafeArea()
            
            
            VStack(alignment: .center, spacing: 25){
                
                
                Text("Snake Color")
                    .font(.system(size: 100))
                
                
                
                Button("Green"){
                    SnakeColor = .green
                }
                .frame(width: 400, height: 150)
                .foregroundColor(.yellow)
                .background(.green)
                .font(.system(size: 80))
                .cornerRadius(80)
                
                Button("Red"){
                    SnakeColor = .red
                }
                .frame(width: 400, height: 150)
                .foregroundColor(.blue)
                .background(.red)
                .font(.system(size: 80))
                .cornerRadius(80)
                
                
                Button("Purple"){
                    SnakeColor = .purple
                }
                .frame(width: 400, height: 150)
                .foregroundColor(.green)
                .background(.purple)
                .font(.system(size: 80))
                .cornerRadius(80)
                
                
                
                Button("White"){
                    SnakeColor = .white
                }
                .frame(width: 400, height: 150)
                .foregroundColor(.black)
                .background(.white)
                .font(.system(size: 80))
                .cornerRadius(80)
                
                
                Button("Black"){
                    SnakeColor = .black
                }
                .frame(width: 400, height: 150)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 80))
                .cornerRadius(80)
                
            }
            
        }
    }
}
