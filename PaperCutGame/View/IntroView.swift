//
//  IntroView.swift
//  PaperCutGame
//
//  Created by Beking on 1/15/24.
//

import SwiftUI

struct IntroView: View {
    
    var screentSize : CGSize
    
    @Binding var inIntro: Bool
    @Binding var inStep: Bool
    @Binding var inGame: Bool

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

                    
                                        
//                    Text("With its roots in ancient China, stands as an enchanting art of intricate designs. \nOriginating in rural communities, it not only symbolizes marital bliss, prosperity, and harmony but also serves as a storytelling medium, reflecting historical events and values.")
//                        .font(.title3)
//                        .foregroundColor(.primary)
//                        .padding()
//                        .padding(.bottom, 50)
//                        .fixedSize(horizontal: false, vertical: true)
                    
                    
                    
//                    Text("Symbolic Paper Cutting Designs")
//                        .font(.title2.bold())
//                    
//                    
//                    Text("Swipe left to switch content.")
//                        .font(.subheadline)
//                    
//                    
//                    SwitchView(screentSize: screentSize) {
//                        EmptyView()
//                    } mainContent: {
//                                
//                        ForEach(intros) { intro in
//                            VStack {
//                                Image(intro.image)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: screentSize.width - 40)
//                                        
//                                Text(intro.ref)
//                                    .font(.subheadline)
//                                    .padding(.bottom, 10)
//                                        
//                                Text(intro.description)
//                                    .font(.title3)
//                                    .fixedSize(horizontal: false, vertical: true)
//                            }
//                                .padding(10)
//                                .frame(width: screentSize.width - 20)
//                        }
//                        
//                    } footContent: {
//                        EmptyView()
//                    }
//                    .padding(10)
//                    .background(Color.gray.opacity(0.2))
//                    .frame(width: screentSize.width, height: screentSize.height / 1.5)
//                    
//                    
//                    Text("The Versatility of Folk Paper Cutting")
//                        .font(.title2.bold())
//                        .padding(.top, 70)
//                    
//                    
//                    Text("Swipe left to switch content.")
//                        .font(.subheadline)
//                    
//                    SwitchView(screentSize: screentSize) {
//                        EmptyView()
//                    } mainContent: {
//                                
//                        ForEach(intros2) { intro in
//                            VStack {
//                                Image(intro.image)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: screentSize.width - 40)
//                                        
//                                Text(intro.ref)
//                                    .font(.subheadline)
//                                    .padding(.bottom, 10)
//                                        
//                                Text(intro.description)
//                                    .font(.title3)
//                            }
//                                .padding(10)
//                                .frame(width: screentSize.width - 20)
//                        }
//                        
//                    } footContent: {
//                        EmptyView()
//                    }
//                    .padding(10)
//                    .background(Color.gray.opacity(0.2))
//                    .frame(width: screentSize.width, height: screentSize.height / 1.5)

                    
           
                    Spacer()
                    
                                     
                    Button("Start Tutorial") {
                        inIntro = false
                        inStep = true
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
                        inIntro = false
                        inGame = true
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
                        inIntro = false
                        inGame = true
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

