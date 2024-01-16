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
                    
                    
                    Text("Symbolic Paper Cutting Designs")
                        .font(.subheadline.bold())
                        .padding(.bottom, 20)
                    
                                        
                    Text("With its roots in ancient China, stands as an enchanting art of intricate designs. \nOriginating in rural communities, it not only symbolizes marital bliss, prosperity, and harmony but also serves as a storytelling medium, reflecting historical events and values.")
                        .font(.title3.bold())
                        .foregroundColor(.primary)
                        .padding()
                    
                    
                    ForEach(intros) { intro in
                        VStack {
                            Image(intro.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: screentSize.height / 3)
                            
                            Text(intro.ref)
                                .font(.subheadline)
                                .padding(.bottom, 20)
                            
                            Text(intro.description)
                                .font(.title3.bold())
                        }
                        .padding()
                        .frame(width: screentSize.width)
                    }
                    
                    Text("Excited to dive in? Join me on an exploration of the fascinating world of paper folding as we unravel the secrets to creating perfectly symmetrical paper cutting designs! Click the Start Button and Let the Adventure Begin!")
                        .font(.title3.bold())
                        .foregroundColor(.primary)
                        .padding()
                    
                    
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
        }
    }
}

struct Intro_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

