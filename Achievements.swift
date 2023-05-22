//
//  Achievements.swift
//  DaSnape
//
//  Created by Nazar Kochylo on 4/24/23.
//

import SwiftUI

struct Achievements: View {
    @State var showingAlert1 = false
    @State var showingAlert2 = false
    @State var showingAlert3 = false
    @State var showingAlert4 = false
    var body: some View {
       
        ZStack {
            Color.orange
                .font(.largeTitle)
        
        .ignoresSafeArea() // 1
            
        
        
            VStack{
                Button("You actually got the game?!") {
                    showingAlert1 = true
                }
                .font(.title)
                .frame(maxWidth: .infinity)
                .background(.orange)
                
                .alert(isPresented:$showingAlert1) {
                    Alert(
                        title: Text("Open the game for the first time")
                        
                        
                    )
                }
                
                Divider()
                
                Button("So this is a grape") {
                    showingAlert2 = true
                }
                .font(.title)
                .frame(maxWidth: .infinity)
                .background(.orange)
                
                .alert(isPresented:$showingAlert2) {
                    Alert(
                        title: Text("Eat your first grape")
                        
                    )
                }
                Divider()
                Button("Theres a wall there") {
                    showingAlert3 = true
                }
                .font(.title)
                .frame(maxWidth: .infinity)
                .background(.orange)
                
                .alert(isPresented:$showingAlert3) {
                    Alert(
                        title: Text("Die for the first time")
                        
                    )
                }
               
                Divider()
                
                Button("Where did the board go") {
                    showingAlert4 = true
                }
                .font(.title)
                .frame(maxWidth: .infinity)
                .background(.orange)
                
                .alert(isPresented:$showingAlert4) {
                    Alert(
                        title: Text("Get so long you cover the board")
                    )
                    
                }
           
              
            }
        }
        
        
        .accentColor(Color.black)
    }
    
}
    
    struct Achievements_Previews: PreviewProvider {
        static var previews: some View {
            Achievements()
        }
    }

