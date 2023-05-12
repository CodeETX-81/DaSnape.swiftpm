//
//  Setting.swift
//  DaSnape
//
//  Created by Bohdan kondratrenko on 4/24/23.
//

import SwiftUI

struct Settings: View {
    @Binding var SnakeColor:Color 
    @State var background:Color = Color.orange
    var body: some View {
       
       
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
        Button("Green"){
            background = .green
                        }

         Button("Blue"){
             background = .blue
                         }

         Button("Red"){
             background = .red
                         }

         Button("Purple"){
             background = .purple
                         }
                               
        
        
        
    }
}
