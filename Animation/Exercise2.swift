//
//  Exercise2.swift
//  Animation
//
//  Created by Eduard on 10.01.2023.
//

import SwiftUI

struct Exercise2: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("DarkAccent2"),Color("DarkShade2")], startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            GeometryReader { proxy in
                VStack {
                    Image("Planet")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 60)
                        .offset(x: show ? 0 : proxy.frame(in: .global).width )
                        .animation(.interpolatingSpring(stiffness: 40, damping: 8).delay(0.3), value: show)
                    
                    Text("Planet Explorer")
                        .foregroundColor(.white)
                        .textCase(.uppercase)
                        .font(.system(size: 30).weight(.semibold))
                        .padding(.bottom, 30)
                        .offset(x: show ? 0 : -proxy.frame(in: .global).width )
                        .animation(.interpolatingSpring(stiffness: 40, damping: 8).delay(0.3), value: show)
                    
                    Text("START")
                        .font(.title)
                        .foregroundColor(Color("LightAccent2"))
                        .opacity(show ? 1 : 0.2)
                        .scaleEffect(show ? 1 : 0)
                        .animation(.interpolatingSpring( stiffness: 25, damping: 5, initialVelocity: 10).delay(0.9), value: show)
                    
                    Text("EXPLORING!")
                        .font(.title)
                        .foregroundColor(Color("LightAccent2"))
                        .padding(.bottom, 30)
                        .opacity(show ? 1 : 0.2)
                        .scaleEffect(show ? 1 : 0)
                        .animation(.interpolatingSpring( stiffness: 25, damping: 5, initialVelocity: 10).delay(1.3), value: show)
                    
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(Color("LightAccent2"))
                        .frame(width: 64, height: 64)
                        .background(Color("Accent2"), in: Circle())
                        .opacity(show ? 1 : 0)
                        .animation(.linear(duration: 1.6).delay(0.4), value: show)
                }
                .padding()
            }
        }
        .onAppear {
            show.toggle()
        }
    }
}

struct Exercise2_Previews: PreviewProvider {
    static var previews: some View {
        Exercise2()
    }
}
