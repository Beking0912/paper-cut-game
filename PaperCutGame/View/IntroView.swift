//
//  IntroView.swift
//  PaperCutGame
//
//  Created by Beking on 1/15/24.
//

import SwiftUI

struct IntroView: View {
    
    var screentSize : CGSize
    
    @Binding var currentMode: GameMode

    var body: some View {
                VStack {
                    Image("header")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screentSize.width)
                        .ignoresSafeArea()
                    
                    Image("title")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    

                    Text("Learn Chinese paper cutting basics in a quick tutorial, then dive into the world of symmetrical art challenges.")
                        .foregroundColor(.primary)
                        .padding(.horizontal, 20)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 40)
                    
           
                    Spacer()
                    
                                     
                    Button("Start Tutorial") {
                        currentMode = .inStep
                    }
                    .frame(width: screentSize.width - 80)
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .padding(15)
                    .background(
                        Color("Yellow"),
                        in: RoundedRectangle(cornerRadius: 15)
                    )
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                    
                    
                    Button("Start Game") {
                        currentMode = .inGame
                    }
                    .frame(width: screentSize.width - 80)
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .padding(15)
                    .background(
                        Color("Green"),
                        in: RoundedRectangle(cornerRadius: 15)
                    )
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                    .padding()
                    
                    
                    Button("Explore More") {
                        currentMode = .inExplore
                    }
                    .frame(width: screentSize.width - 80)
                    .font(.title3.bold())
                    .foregroundColor(Color("Blue"))
                    .padding(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Blue"), lineWidth: 2)
                    )
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                    
                    
                    Spacer()
                }
            .background(Color("Background"))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            .ignoresSafeArea()
    }
}

struct Intro_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

