//
//  ContentView.swift
//  Animation
//
//  Created by Eduard on 08.01.2023.
//

import SwiftUI

struct ContentView: View  {
    var body: some View {
        NavigationStack {
            List {
                Group {
                    NavigationLink(destination: AnimationOptionsExercise()) {
                        Text("AnimationOptionsExercise")
                    }
                    NavigationLink(destination: AnimationOptionsChallenge()) {
                        Text("AnimationOptionsChallenge")
                    }
                }
                Group {
                    NavigationLink(destination: SpringAnimationsExercise()) {
                        Text("SpringAnimationsExercise")
                    }
                    NavigationLink(destination: SpringAnimationsChallenge()) {
                        Text("SpringAnimationsChallenge")
                    }
                    NavigationLink(destination: SpringAnimationsChallenge2()) {
                        Text("SpringAnimationsChallenge2")
                    }
                }
                Group{
                    NavigationLink(destination: TransitionsExercise()) {
                        Text("TransitionsExercise")
                    }
                    NavigationLink(destination: TransitionsChallenge1()) {
                        Text("TransitionsChallenge1")
                    }
                    NavigationLink(destination: TransitionsChallenge2()) {
                        Text("TransitionsChallenge2")
                    }
                }
                Group{
                    NavigationLink(destination: CustomTimingCurveExample()) {
                        Text("CustomTimingCurveExample")
                    }
                    NavigationLink(destination: CustomTimingChallenge()) {
                        Text("CustomTimingChallenge")
                    }
                }
                Group {
                    NavigationLink(destination: MatchedGeometryEffectExample()) {
                        Text("MatchedGeometryEffectExample")
                    }
                }
            }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
