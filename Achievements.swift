//
//  Achievements.swift
//  DaSnape
//
//  Created by Nazar Kochylo on 4/24/23.
//

import SwiftUI

struct Achievements: View {
    @State private var showingAlert = false
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea() // 1
            VStack {
                Button("You actually got the game?!") {
                    showingAlert = true
                }
                .font(.title)
                .frame(maxWidth: .infinity)
                .background(.red)
                
                .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("Open the game for the first time")
                        
                        
                    )
                }
                Divider()
                Button("So this is a grape") {
                    showingAlert = true
                }
                .font(.title)
                .frame(maxWidth: .infinity)
                .background(.red)
                Divider()
                
                Group{
                    Text("There was a wall there")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .background(.red)
                    Divider()
                }
                Group{
                    Text("Where did the board go?")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .background(.red)
                    Divider()
                }
            }
        }
        .accentColor(Color.black)
    }
    
    
    struct Achievements_Previews: PreviewProvider {
        static var previews: some View {
            Achievements()
        }
    }
}
