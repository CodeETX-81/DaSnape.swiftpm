//
//  Achievements.swift
//  DaSnape
//
//  Created by Nazar Kochylo on 4/24/23.
//

import SwiftUI

struct Achievements: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea() // 1
            VStack {
                Group{
                    Text("you actually got the game???")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .background(.red)
                    Divider()
                  
                }
                Group{
                    Text("So this is a grap")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .background(.red)
                    Divider()
                }
                Text("")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .background(.red)
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
