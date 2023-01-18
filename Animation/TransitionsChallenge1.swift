//
//  TransitionsChallenge1.swift
//  Animation
//
//  Created by Eduard on 16.01.2023.
//

import SwiftUI

struct TransitionsChallenge1: View {
    @State private var isShowing = false
    
    var body: some View {
        ZStack {
            Group{
                if isShowing{
                    VStack(spacing: 20)  {
                        Spacer()
                        Spacer()
                        Text("Explore")
                            .textCase(.lowercase)
                        
                        Text("The great desert")
                            .font(.title)
                            .textCase(.uppercase)
                        
                        Button {
                            
                        } label: {
                            Text("Experience")
                                .textCase(.uppercase)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 16)
                                .foregroundColor(Color("Gold"))
                                .background {
                                    RoundedRectangle(cornerRadius: 24)
                                        .stroke(Color("Gold"))
                                }
                        }
                        .padding(.bottom)
                        Spacer()
                        
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .animation(.easeInOut(duration: 1.4), value: isShowing)
            
            VStack {
                Text("Desert Life")
                    .font(.largeTitle)
                    .padding(.vertical)

                Spacer()
                if isShowing {
                    Image("desert")
                        .transition(.move(edge: .bottom))
                }
                
            }
            .animation(.easeInOut(duration: 1), value: isShowing)
        }
        .onAppear {
            isShowing = true
            
        }
    }
}

struct TransitionsChallenge1_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TransitionsChallenge1()
        }
    }
}
