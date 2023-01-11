//
//  Challenge2.swift
//  Animation
//
//  Created by Eduard on 09.01.2023.
//

import SwiftUI

struct Challenge2: View {
    @State private var isAppear = false
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color("Darkest"), Color("Dark")], center: .center, startRadius: 20, endRadius: 400)
                .ignoresSafeArea()
            
            VStack{
                Text("Challenge 2")
                    .textCase(.uppercase)
                    .font(.custom("DIN Condensed Bold", size: 50))
                    .foregroundColor(Color("Gold"))
                
                Text("Recreate this Animation")
                    .font(.title)
                    .foregroundColor(Color("Accent"))
               
                
                GeometryReader { proxy in
                    HStack {
                        Button {} label: {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.system(size: 80))
                                
                        }
                        .tint(Color("Accent"))
                        .overlay {
                            Circle()
                                .stroke(Color("Gold"), lineWidth: 5)
                                .opacity(isAppear ? 0 : 1)
                                .scaleEffect(isAppear ? 1.8 : 0.9)
                                .animation(.easeInOut(duration: 1).repeatCount(5).delay(2), value: isAppear)
                                
                        }
                        .rotationEffect(isAppear ? .degrees(0) : .degrees(-270))
                        .offset(x: isAppear ? proxy.size.width : 0)
                        .animation(.easeIn(duration: 1).delay(1.5), value: isAppear)
                         
                    }
                    .offset(x: -120)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    
                    
                }
            }
            
            Text("Welcome!")
                .font(.custom("DIN Condensed Bold", size: 60))
                .foregroundColor(Color("Gold"))
                .opacity(isAppear ? 1 : 0)
                .animation(.easeInOut(duration: 1).delay(0.4), value: isAppear)
        }
        .onAppear{
            isAppear.toggle()
        }
    }
}
    struct Challenge2_Previews: PreviewProvider {
        static var previews: some View {
            Challenge2()
        }
    }
