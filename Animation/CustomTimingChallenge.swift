//
//  CustomTimingChallenge.swift
//  Animation
//
//  Created by Eduard on 04.02.2023.
//

import SwiftUI

struct CustomTimingChallenge: View {
    @State private var currentIndex = 0
    let transport = ["car", "tram", "airplane"]
    
    var body: some View {
        ZStack(alignment: .leading) {
            LinearGradient(colors: [Color("Background4"),Color("Secondary4")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                ForEach(Array(transport.enumerated()), id: \.offset) { index, item in
                    Image(systemName: item)
                        .background(
                            Circle()
                                .fill(Color("Accent4"))
                                .frame(width: 70, height: 70)
                            
                        )
                        .scaleEffect(currentIndex == index ? 1.6 : 1)
                        .onTapGesture {
                            currentIndex = index
                        }
                       
                    Spacer()
                }

            }
            .font(.title2)
            .foregroundColor(Color("Tertiary4"))
            .frame(width: 70)
            .background(Color("Accent4"))
            .animation(.timingCurve(0, 0.4, 0.7, 1.8), value: currentIndex)
        }
    }
}

struct CustomTimingChallenge_Previews: PreviewProvider {
    static var previews: some View {
        CustomTimingChallenge()
    }
}
