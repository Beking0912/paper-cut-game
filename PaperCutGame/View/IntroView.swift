//
//  IntroView.swift
//  PaperCutGame
//
//  Created by Beking on 1/15/24.
//

import SwiftUI

struct IntroView: View {
    var screentSize : CGSize

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    Image("header")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screentSize.width)
                        .ignoresSafeArea()
                    
                    
                    Text("Chinese Paper Cutting")
                        .font(.largeTitle.bold())
                        .padding(.top, 20)
                    
                                        
                    Text("With its roots in ancient China, stands as an enchanting art of intricate designs. \nOriginating in rural communities, it not only symbolizes marital bliss, prosperity, and harmony but also serves as a storytelling medium, reflecting historical events and values.")
                        .font(.title3.bold())
                        .foregroundColor(.primary)
                        .padding()
                        .padding(.bottom, 50)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    
                    
                    Text("Symbolic Paper Cutting Designs")
                        .font(.title2.bold())
                    
                    
                    Text("Swipe left to switch content.")
                        .font(.subheadline)
                    
                    
                    SwitchView(screentSize: screentSize) {
                        EmptyView()
                    } mainContent: {
                                
                        ForEach(intros) { intro in
                            VStack {
                                Image(intro.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: screentSize.width - 40)
                                        
                                Text(intro.ref)
                                    .font(.subheadline)
                                    .padding(.bottom, 10)
                                        
                                Text(intro.description)
                                    .font(.title3.bold())
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                                .padding(10)
                                .frame(width: screentSize.width - 20)
                        }
                        
                    } footContent: {
                        EmptyView()
                    }
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .frame(width: screentSize.width, height: screentSize.height / 1.5)
                    
                    
                    Text("The Versatility of Folk Paper Cutting")
                        .font(.title2.bold())
                        .padding(.top, 70)
                    
                    
                    Text("Swipe left to switch content.")
                        .font(.subheadline)
                    
                    SwitchView(screentSize: screentSize) {
                        EmptyView()
                    } mainContent: {
                                
                        ForEach(intros2) { intro in
                            VStack {
                                Image(intro.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: screentSize.width - 40)
                                        
                                Text(intro.ref)
                                    .font(.subheadline)
                                    .padding(.bottom, 10)
                                        
                                Text(intro.description)
                                    .font(.title3.bold())
                            }
                                .padding(10)
                                .frame(width: screentSize.width - 20)
                        }
                        
                    } footContent: {
                        EmptyView()
                    }
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .frame(width: screentSize.width, height: screentSize.height / 1.5)
                    
                    
                    Text("Excited to dive in? Join me on an exploration of the fascinating world of paper folding as we unravel the secrets to creating perfectly symmetrical paper cutting designs! Click the Start Button and let's together craft a beautiful snowflake papercut masterpiece!")
                        .font(.title3.bold())
                        .foregroundColor(.primary)
                        .padding(.horizontal, 20)
                        .padding(.top, 50)
                    
                    Image("snowflake")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screentSize.width / 3)
                    
                    
                    Spacer()
                    
                    NavigationLink(destination: HomeView(screentSize: screentSize)) {
                        Text("Get Started")
                            .font(.title.bold())
                            .foregroundColor(Color("Red"))
                            .padding()
                            .border(Color("Red"), width: 4)
                    }
                    .padding(.vertical, 60)
                    
                    
                    Image("footer")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screentSize.width)
                        .ignoresSafeArea()
                }
            }
            .background(Color("Background"))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .ignoresSafeArea()
            
        }.navigationBarHidden(true)
    }
}

struct Intro_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

