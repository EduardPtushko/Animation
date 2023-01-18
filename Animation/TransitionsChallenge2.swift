//
//  TransitionsChallenge2.swift
//  Animation
//
//  Created by Eduard on 18.01.2023.
//

import SwiftUI

struct TransitionsChallenge2: View {
    @State private var username = ""
    @State private var password = ""
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color("Background3")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Image(systemName: "bed.double.fill")
                    .padding(.top, 50)
                    .font(.system(size: 80))
                    .foregroundColor(Color("Tertiary3"))
                
                Spacer()
                
                if show {
                    Text("Welcome back, friend")
                        .font(.title.weight(.light))
                        .padding(.bottom, 8)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
                
                if show {
                    TextField("Username", text: $username)
                        .font(.title3)
                        .padding(10)
                        .background(Color(.white))
                        .cornerRadius(4)
                        .transition(.move(edge: .leading).combined(with: .opacity))
                }
                
                if show {
                    SecureField("Password", text: $password)
                        .font(.title3)
                        .padding(10)
                        .background(Color(.white))
                        .cornerRadius(4)
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                }
                
                if show {
                    Button {
                        
                    } label: {
                        Text("come in")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background {
                                Rectangle()
                                    .fill(.red)
                            }
                            .cornerRadius(4)
                            .shadow(radius: 8, x: 2, y: 2)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                
                Spacer()
                
                Image("person.sleeping")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            .padding(.horizontal)
            
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.8).delay(0.4)) {
                show = true
            }
        }
    }
}

struct TransitionsChallenge2_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            TransitionsChallenge2()
        }
    }
}
