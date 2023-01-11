//
//  Exercise1.swift
//  Animation
//
//  Created by Eduard on 11.01.2023.
//

import SwiftUI

struct Exercise1: View {
    @State private var showForm = false
    @State private var username = ""
    @State private var password = ""
    @State private var isShow = [false, false, false]
    
    let xOffset: CGFloat = -200
    let duration: Double = 0.7
    let delay = 0.5
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                RadialGradient(colors: [Color("Darkest"), Color("Dark")], center: .center, startRadius: 10, endRadius: 400)
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    Text("Exercise")
                        .font(.custom("DIN Condensed Bold", size: 70))
                    
                    Text("Show Login")
                        .font(.title)
                        .foregroundColor(.gray)
                    Spacer()
                    
                    VStack(spacing: 30) {
                        Image(systemName: "lock.shield")
                            .zIndex(1)
                            .font(.system(size: 70))
                            .padding()
                            .scaleEffect(showForm ? 1 : 4)

                            .onTapGesture {
                                withAnimation(.easeIn(duration: duration/2).delay(delay)) {
                                    showForm = true
                                }
                                
                                withAnimation(.easeIn(duration: duration).delay(delay + 0.2)) {
                                    isShow[0] = true
                                }
                                withAnimation(.easeIn(duration: duration).delay(delay  + 0.4)) {
                                    isShow[1] = true
                                }
                                
                                withAnimation(.easeIn(duration: duration).delay(delay  + 0.6)) {
                                    isShow[2] = true
                                }
                            }
                        
                      
                            TextField("Username", text: $username)
                                .font(.title3)
                                .padding(10)
                                .background(.white, in: RoundedRectangle(cornerRadius: 4))
                                .opacity( showForm ? 1 : 0)
                                .offset(x: isShow[0] ? 0 : -proxy.size.width)
                            
                            SecureField("Password", text: $password)
                                .font(.title3)
                                .padding(10)
                                .background(.white, in: RoundedRectangle(cornerRadius: 4))
                                .opacity( showForm ? 1 : 0)
                                .offset(x: isShow[1] ? 0 : -proxy.size.width)
                            

                        Button {
                            
                        } label: {
                            Text("Login")
                                .font(.title)
                                .foregroundColor(Color("Accent"))
                        }
                        .opacity( showForm ? 1 : 0)
                        .offset(x: isShow[2] ? 0 : -proxy.size.width)
      
                    }
                    .padding(.horizontal)
                    Spacer()
                    Spacer()
                }
                .foregroundColor(Color("Gold"))
               
            }
            
            
        
        }
    }
}

struct Exercise1_Previews: PreviewProvider {
    static var previews: some View {
        Exercise1()
    }
}
