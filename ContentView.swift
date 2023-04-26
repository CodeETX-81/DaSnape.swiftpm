import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Intro()
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
            
        }
        NavigationView {
            NavigationLink {
                Achievements()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 300, height: 100)
                    Text("Acheievement")
                        .foregroundColor(.black)
                        .font(Font.custom(
                            "Times New Roman", size: 79))
                }
            }
            
        }
        NavigationView {
            NavigationLink {
                Settings()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 300, height: 100)
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(Font.custom(
                            "Times New Roman", size: 79))
                }
            }
            
        }
    }
}
