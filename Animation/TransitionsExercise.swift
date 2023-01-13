//
//  Exercise3.swift
//  Animation
//
//  Created by Eduard on 11.01.2023.
//

import SwiftUI

struct TransitionsExercise: View {
    @State private var next = true
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("Background3")
            
            VStack(spacing: 60) {
                           Spacer()
                           
                           if next {
                               Text("Ready to travel?")
                                   .bold()
                                   .foregroundColor(Color("Secondary3"))
                                   .transition(.move(edge: .leading))
                           }
                           
                           if next {
                               VStack(spacing: 60) {
                                   Image("traveling")
                                       .animation(.easeIn(duration: 1), value: next)
                                   
                                   Capsule()
                                       .fill(Color("Secondary3"))
                                       .frame(height: 100)
                                       .offset(x: -50)
                                       .animation(.easeInOut(duration: 0.6), value: next)
                                       .overlay(
                                        Text("Let's go!")
                                           .foregroundColor(Color("Foreground3"))
                                           .animation(.easeOut(duration: 0.6), value: next)
                                       )
                               }
                               .transition(.move(edge: .leading))
                           }
                           Spacer()
                       }
                       .animation(.easeOut(duration: 1.1), value: next)
            
            VStack(spacing: 40) {
                Spacer()
                if !next {
                    Text("Where do you want to go?")
                        .bold()
                        .foregroundColor(Color("Secondary3"))
                        .multilineTextAlignment(.center)
                        .transition(.move(edge: .top))
                }
                
                if !next {
                    DashboardView()
                        .transition(.move(edge: .trailing))
                }
                if !next {
                    Image("airplane")
                        .transition(.move(edge: .bottom))
                    
                }
                Spacer()
            }
            .padding(.horizontal)
            .animation(.easeOut(duration: 0.8), value: next)
            
            
            VStack {
                Spacer()
                HStack(spacing: 40){
                    Button {
                        next.toggle()
                    } label: {
                        Image(systemName: "chevron.right.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(Color("Accent3"))
                            .rotationEffect(.degrees(next ? 0 : -180))
                    }
                    
                    if !next {
                        Button {
                            next.toggle()
                        } label: {
                            Image(systemName: "chevron.right.circle.fill")
                                .font(.system(size: 50))
                               
                        }
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                    }
                    
                }
                .animation(.easeOut(duration: 1), value: next)
            }
            .padding(.bottom, 75)
            

        }
        .font(.largeTitle)
        .tint(Color("Accent3"))
        .ignoresSafeArea()
    }
}

struct TransitionsExercise_Previews: PreviewProvider {
    static var previews: some View {
        TransitionsExercise()
    }
}

struct DashboardView: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Destination")
                    .font(.headline)
                    .foregroundColor(Color("Foreground3"))
                HStack {
                    Text("Select")
                        .foregroundColor(Color("Accent3"))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("Accent3"))
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Departure")
                    .font(.headline)
                    .foregroundColor(Color("Foreground3"))
                HStack {
                    Text("Today")
                        .foregroundColor(Color("Accent3"))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("Accent3"))
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Return")
                    .font(.headline)
                    .foregroundColor(Color("Foreground3"))
                HStack {
                    Text("Tomorrow")
                        .foregroundColor(Color("Accent3"))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("Accent3"))
                }
            }
            
        }
        .font(.body)
        .padding(24)
        .background(Color("Secondary3"), in: RoundedRectangle(cornerRadius: 8))
        .padding()
       
    }
}
