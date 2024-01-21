//
//  ExploreView.swift
//  PaperCutGame
//
//  Created by Beking on 1/20/24.
//

import SwiftUI

struct ExploreView: View {
    
    var screentSize : CGSize
    
    @Binding var currentMode: GameMode

    var body: some View {
        ScrollView {
            VStack {

                SwitchView(
                    screentSize: screentSize,
                    count: intros.count,
                    currentMode: $currentMode
                ) {
                    VStack {
                        Text("Symbolic Paper Cutting Designs")
                            .font(.title2.bold())
                        
                        Text("Swipe left to switch content.")
                            .font(.subheadline)
                    }.padding()
                } mainContent: {
                    
                    ForEach(intros) { intro in
                        VStack {
                            Image(intro.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: screentSize.width - 40)
                            
                            Text(intro.ref)
                                .font(.subheadline)
                                .padding(.bottom, 20)
                            
                            Text(intro.description)
                                .font(.title3)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(10)
                        .frame(width: screentSize.width - 20)
                    }
                    
                } footContent: {
                    EmptyView()
                }
                .padding(10)
                .frame(width: screentSize.width, height: screentSize.height)
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                
                
                
                
//                Text("The Versatility of Folk Paper Cutting")
//                    .font(.title2.bold())
//                    .padding(.top, 70)
//                
//                
//                Text("Swipe left to switch content.")
//                    .font(.subheadline)
//                
//                SwitchView(screentSize: screentSize) {
//                    EmptyView()
//                } mainContent: {
//                    
//                    ForEach(intros2) { intro in
//                        VStack {
//                            Image(intro.image)
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: screentSize.width - 40)
//                            
//                            Text(intro.ref)
//                                .font(.subheadline)
//                                .padding(.bottom, 10)
//                            
//                            Text(intro.description)
//                                .font(.title3)
//                        }
//                        .padding(10)
//                        .frame(width: screentSize.width - 20)
//                    }
//                    
//                } footContent: {
//                    EmptyView()
//                }
//                .padding(10)
//                .background(Color.gray.opacity(0.2))
//                .frame(width: screentSize.width, height: screentSize.height / 1.5)
                
                
                
                Spacer()
                
                
                
            }
        }
            .background(Color("Background"))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
