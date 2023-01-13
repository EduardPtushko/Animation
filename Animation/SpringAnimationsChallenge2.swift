//
//  Challenge3.swift
//  Animation
//
//  Created by Eduard on 11.01.2023.
//

import SwiftUI

struct SpringAnimationsChallenge2: View {
    @State private var activeButton = 1
    
    var isContinue: Bool {
        activeButton == 3
    }
   
    var body: some View {
        ZStack {
            Color("Darkest")
                .ignoresSafeArea()
            Rectangle()
                .fill(Color("DarkAccent2"))
                .rotationEffect(.degrees(-15))
                .offset(x: -60, y: 100)
            
            VStack{
                Text("Welcome to")
                    .font(.largeTitle)
                    .foregroundColor(Color("Accent"))
                    .padding()
                Text("SwiftUI Animations")
                    .font(.title.weight(.semibold))
                    .foregroundColor(Color("Accent"))
                    .padding(.bottom, 50)
                
                GeometryReader { proxy in
                    let width = proxy.frame(in: .global).width
                    HStack {
                        VStack(spacing: 20) {
                            Image("woman.reading")
                            Text("Learn by watching videos and looking at code.")
                                .foregroundColor(Color("LightAccent2"))
                                .multilineTextAlignment(.center)
                                .padding()
                                .animation(.interpolatingSpring( stiffness: 30, damping: 8).delay(0.1), value: activeButton)
                        }
                        .frame(width: width)
                       
                        
                        VStack(spacing: 20) {
                            Image("woman.solving.problem")
                            Text("Step-by-step exercises, quizzes and practical challenges.")
                                .foregroundColor(Color("LightAccent2"))
                                .multilineTextAlignment(.center)
                                .padding()
                                .animation(.interpolatingSpring( stiffness: 30, damping: 8).delay(0.1), value: activeButton)
                        }
                        .frame(width: width)
                        
                        VStack(spacing: 20) {
                            Image("woman.bike")
                            Text("Master SwiftUI Animations Today!")
                                .foregroundColor(Color("LightAccent2"))
                                .multilineTextAlignment(.center)
                                .padding()
                                .animation(.interpolatingSpring( stiffness: 30, damping: 8).delay(0.1), value: activeButton)
                        }
                        .frame(width: width)
                       
                    }
                    .font(.title)
                    .frame(width: width * 3)
                    .offset(x: activeButton == 1 ? 0 : activeButton == 2 ? -width : -width * 2
                    )
                    .animation(.interpolatingSpring( stiffness: 20, damping: 7, initialVelocity: 2), value: activeButton)
                }
                
                HStack(spacing: 20) {
                    ForEach(1..<4) { element in
                        Button{
                          
                                activeButton = element
                            
                        } label: {
                            Text("\(element)")
                                .font(.title)
                                .foregroundColor(Color("Accent"))
                               
                            
                        }
                        .frame(width: 50, height: 50)
                        .background(Color("Accent2"), in: Circle())
                        .scaleEffect(element == activeButton ? 1: 0.7)
                        .animation(.spring(dampingFraction: 0.6), value: activeButton)
                    }
                }
                
                
                Button{} label: {
                    Label("Continue", systemImage: "chevron.right")
                        .labelStyle(.trailingIcon)
                        .foregroundColor(Color("Accent"))
                }
                .padding()
                .padding(.horizontal)
                .background(Color("Accent2"), in: Capsule())
                .padding(.vertical)
                .padding(.top, 16)
                .opacity(isContinue ? 1 : 0)
                .animation(.none, value: isContinue)
                .scaleEffect(isContinue ? 1 : 0.2)
                .animation(.interpolatingSpring(stiffness: 35, damping: 9, initialVelocity: 8), value: isContinue)
            }
            .padding(.horizontal)
        }
    }
}

struct SpringAnimationsChallenge2_Previews: PreviewProvider {
    static var previews: some View {
        SpringAnimationsChallenge2()
    }
}


struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}

