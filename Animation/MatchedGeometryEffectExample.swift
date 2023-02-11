//
//  MatchedGeometryEffectExample.swift
//  Animation
//
//  Created by Eduard on 06.02.2023.
//

import SwiftUI

struct MatchedGeometryEffectExample: View {
    @Namespace var namespace
    @State private var currentItem: Item?
    let items = Items.getUtahNationalParks()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12, pinnedViews: .sectionHeaders) {
                Section( header: ParksHeaderView()) {
                    ForEach(items) { item in
                        ParkRowView(namespace: namespace, item: item, currentItem: $currentItem)
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .overlay {
            ParkDetailsView(namespace: namespace, currentItem: $currentItem)
        }
    }
}


struct ParksHeaderView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(UIColor.systemBackground).opacity(0.8)
            Text("Utah National Parks".uppercased())
                .font(.title.bold())
                .frame(maxWidth: .infinity)
        }
        .frame(height: 120)
    }
}


struct ParkRowView: View {
    var namespace: Namespace.ID
    let item: Item
    @Binding var currentItem: Item?
    
    var body: some View {
       VStack {
            if item.id != currentItem?.id {
                ZStack(alignment: .bottom) {
                    Image(item.imageName)
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(30)
                        .matchedGeometryEffect(id: item.imageName, in: namespace)
                    
                    Text(item.name)
                        .font(.title2.bold())
                        .matchedGeometryEffect(id: "\(item.id)name", in: namespace, properties: .position)
                        .zIndex(1)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemBackground).opacity(0.4))
                }
            } else {
                Image(item.imageName)
                    .resizable()
                    .scaledToFill()
                    .hidden()
            }
        }
        .padding(.horizontal, 12)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.5)) {
                currentItem = item
            }
            
        }
    }
}


struct MatchedGeometryEffectExample_Previews: PreviewProvider {
    @Namespace static var namespace
    @State static private var item: Item? = Items.getUtahNationalParks()[1]
    
    static var previews: some View {
        MatchedGeometryEffectExample()
        ParkDetailsView(namespace: namespace,  currentItem: $item)
    }
}

struct ParkDetailsView: View {
    var namespace: Namespace.ID
    @Binding var currentItem: Item?
    @State private var show: Bool = false
    
    var body: some View {
        if let item = currentItem {
            ZStack {
                Color(UIColor.systemBackground)
                    .ignoresSafeArea()
                GeometryReader{_ in
                    Image(item.imageName)
                        .resizable()
                        .scaledToFill()
                        .opacity(0.4)
                        .blur(radius: 30)
                        .ignoresSafeArea()
                }
                ScrollView {
                    VStack {
                        HStack {
                            Text(item.name)
                                .font(.title.bold())
                                .matchedGeometryEffect(id: "\(item.id)name", in: namespace, properties: .position)
                            Spacer()
                            Button {
                                
                            } label: {
                                Image(systemName: "bookmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                    .padding(10)
                                    .background(Circle())
                                    .shadow(radius: 15, y: 10)
                            }
                            .offset(x: show ? 0 : 100)
                        }
                        .padding(.horizontal)
                        .animation(.easeInOut(duration: 0.4), value: show)
                        
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .matchedGeometryEffect(id: item.imageName, in: namespace)
                        VStack {
                            HStack {
                                Text(item.location)
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image(systemName: "map")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14))
                                        .padding(10)
                                        .background(Circle())
                                        .shadow(radius: 15, y: 10)
                                }
                            }
                            
                            Text(item.details)
                            Button {
                                withAnimation {
                                    show = false
                                    currentItem = nil
                                }
                               
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                    .padding()
                                    .background(Circle())
                                    .shadow(radius: 15, y: 10)
                                    .offset(y: 20)
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .offset(y: show ? 0 : 20)
                        .opacity( show ? 1 : 0)
                    }
                    .animation(.easeInOut(duration: 0.5), value: show)
                }
                .tint(Color("Gold"))
                .onAppear {
                    show = true
                }
            }
        }
    }
}




