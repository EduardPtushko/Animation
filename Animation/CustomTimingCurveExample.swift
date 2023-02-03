//
//  CustomTimingCurveExample.swift
//  Animation
//
//  Created by Eduard on 19.01.2023.
//

import SwiftUI

struct CustomTimingCurveExample: View {
    @State private var show = false
    
    let gradient = LinearGradient(colors: [Color("Background4"),Color("Secondary4")], startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            gradient
                .ignoresSafeArea()
            
            VStack{
                Text("Workout Pro")
                    .font(.largeTitle.weight(.light))
                    .foregroundColor(Color("Foreground4"))
                    .padding(.top, -24)
                    
                Spacer()
            }
               
            Group {
                Menu(show: $show)
                WelcomeBackView(show: $show)
            }

        }
    }
}


struct WelcomeBackView: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome Back,")
                .font(.title2.weight(.light))
                .padding(.top, 20)
            
            Text("Jaqueline")
                .font(.title.bold())
            
            Image("profile.female")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
            
            Spacer()
            
            Button {
                    show = true
            } label: {
                Text("See Details")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(OutlineButtonStyle())
            .padding()
        }
        .frame(width: 300, height: 600)
        .background(Color("Secondary4"), in:  RoundedRectangle(cornerRadius: 16))
        .foregroundColor(Color("Foreground4"))
        .shadow(radius: 16)
        .scaleEffect(show ? 0.7 : 1)
        .blur(radius: show ? 5 : 0)
        .animation(show ? .easeInOut(duration: 1).delay(0.1) : .timingCurve(0.5, 0.2, 0.5, 1.5, duration: 1), value: show)
    }
}


struct Menu: View {
    @Binding var show: Bool
    let blurRadius: CGFloat = 4
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                VStack(spacing: 20) {
                    Text("Stats")
                        .font(.title2)
                        .padding()
                       Button {} label: {
                           Image("stopwatch")
                       }
                       .buttonStyle(OutlineButtonStyle())
                       
                       Button {} label: {
                           Image("heart.rate")
                       }
                       .buttonStyle(OutlineButtonStyle())
                       
                       Button {} label: {
                           Image("scale")
                       }
                       .buttonStyle(OutlineButtonStyle())
                }
                .padding()
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(
                    Color("Background4"), in: RoundedRectangle(cornerRadius: 16)
                )
                .shadow(radius: 8)
                .scaleEffect(show ? 1 : 0.8)
                .blur(radius: show ? 0 : blurRadius)
                .offset(x: show ? 0: -90)
                .animation(show ? .timingCurve(0, -2, 1, 0, duration: 1) : .timingCurve(0, 1, 0, 1.5, duration: 1), value: show)
                
                Spacer()
                
                VStack(spacing: 20) {
                    Text("Exercise")
                        .font(.title2)
                        .padding()
                       Button {} label: {
                           Image("jump.rope")
                       }
                       .buttonStyle(OutlineButtonStyle())
                       
                       Button {
                           
                       } label: {
                            
                           Image("dumbbell")
                       }
                       .buttonStyle(OutlineButtonStyle())
                       
                       Button {
                           
                       } label: {
                            
                           Image("kettlebell")
                       }
                       .buttonStyle(OutlineButtonStyle())
                           
                
                }
                .padding()
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(
                    Color("Background4"), in: RoundedRectangle(cornerRadius: 16)
                )
                .shadow(radius: 8)
                .scaleEffect(show ? 1 : 0.8)
                .blur(radius: show ? 0 : blurRadius)
                .offset(x: show ? 0: 90)
                .animation(show ? .timingCurve(0, -2, 1, 0, duration: 1) : .timingCurve(0, 1, 0, 1.5, duration: 1), value: show)
            }
            
            Button {
                show = false
            } label: {
                 Text("Done")
                    .font(.title)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(OutlineButtonStyle())
            .offset(y: show ? 0 : 200)
            .animation(.easeOut(duration: 1), value: show)
            
            
        }
        .padding()
        .foregroundColor(Color("Foreground4"))
        .zIndex(show ? 1 : 0)
    }
}


struct OutlineButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("Accent4").opacity(0.1))
            )
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("Accent4").opacity(0.8), lineWidth: 0.8)
            }
    }
}


struct CustomTimingCurveExample_Previews: PreviewProvider {
    static var previews: some View {
        
            CustomTimingCurveExample()
                
        
    }
}
