//
//  ContentView.swift
//  PaperCutGame
//
//  Created by Beking on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var endAnimation : Bool = false
    
    @State var inIntro : Bool = false
    @State var inExplore : Bool = false
    @State var inStep : Bool = false
    @State var inGame : Bool = false
    @State var score : Int = 0
    
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            
//            ExploreView(screentSize: size)
//            IntroView(screentSize: size, inIntro: $inIntro, inStep: $inStep, inGame: $inGame)
//            AboutView(screentSize: size, inGame: $inGame, score: $score)
//            GameView(screentSize: size, inGame: $inGame, score: $score)
//            HomeView(screentSize: size, inStep: $inStep, inGame: $inGame)
//            SplashScreen(endAnimation: $endAnimation, inIntro: $inIntro)
            
            if endAnimation {
                if inIntro {
                    IntroView(screentSize: size, inIntro: $inIntro, inStep: $inStep, inGame: $inGame, inExplore: $inExplore)
                } else if inExplore {
                    ExploreView(screentSize: size, inIntro: $inIntro, inExplore: $inExplore)
                } else if inStep {
                    HomeView(screentSize: size, inStep: $inStep, inGame: $inGame)
                } else if inGame {
                    GameView(screentSize: size, inGame: $inGame, score: $score)
                } else {
                    AboutView(screentSize: size, inGame: $inGame, inExplore: $inExplore, score: $score)
                }
            } else {
                SplashScreen(endAnimation: $endAnimation, inIntro: $inIntro)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

