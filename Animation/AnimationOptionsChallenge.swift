//
//  Challenge1.swift
//  Animation
//
//  Created by Eduard on 09.01.2023.
//

import SwiftUI

struct AnimationOptionsChallenge: View {
    @State private var isShowing = false
    @State private var isFadeIn = false
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color("Darkest"), Color("Dark")], center: .center, startRadius: 20, endRadius: 400)
                .ignoresSafeArea()
            
                VStack{
                    Text("Challenge 1")
                        .textCase(.uppercase)
                        .font(.custom("DIN Condensed Bold", size: 50))
                        .foregroundColor(Color("Gold"))
                    
                    Text("Recreate this Animation")
                        .font(.title)
                        .foregroundColor(Color("Accent"))
                    
                    RoundedRectangle(cornerRadius: 40)
                        .fill(.ultraThinMaterial)
                        .padding()
                    
                    GeometryReader { proxy in
                    HStack(spacing: 30) {
                        Spacer()
                       Group{
                           Image(systemName: "pencil")
                            Image(systemName: "scribble")
                         
                            Image(systemName: "lasso")
                         
                            Image(systemName: "scissors")
                       }
                       .opacity(isFadeIn ? 1 : 0)
                       .animation(.easeInOut.delay(0.4), value: isFadeIn)
                    
                        Image(systemName: "line.3.horizontal.decrease")
                            .rotationEffect(Angle(degrees: -90))
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.4)) {
                                    isShowing.toggle()
                                    
                                }
                                isFadeIn.toggle()
                            }
                    }
                    .padding(.vertical)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .background {
                       Rectangle()
                            .fill(Color("Gold"))
                            .cornerRadius(35, corners: [.topRight, .bottomRight])
                           
                    }
                
                    .offset(x: isShowing ? -16 : -proxy.frame(in: .global).width + 48 )
                    
                 
                }
                    .frame(height: 70)
            }
        }
    }
}

struct AnimationOptionsChallenge_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOptionsChallenge()
    }
}


