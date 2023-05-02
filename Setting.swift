//
//  Setting.swift
//  DaSnape
//
//  Created by Bohdan kondratrenko on 4/24/23.
//

import SwiftUI

struct Settings: View {
    @State var snakecolor:Color = .orange
    
    var body: some View {
       
        Button("Green"){
            snakecolor = .green
                        }
        
         Button("Blue"){
             snakecolor = .blue
                         }
        
         Button("Red"){
             snakecolor = .red
                         }
        
         Button("Purple"){
             snakecolor = .purple
                         }
        
         Button("White"){
             snakecolor = .white
                         }
        
         Button("Black"){
             snakecolor = .black
                         }
        
    }
}
