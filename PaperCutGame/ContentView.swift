//
//  ContentView.swift
//  PaperCutGame
//
//  Created by Beking on 1/12/24.
//

import SwiftUI

enum GameMode {
    case inIntro
    case inExplore
    case inStep
    case inGame
    case inResult
}

struct ContentView: View {
    @State var endAnimation : Bool = false
    @State var currentMode: GameMode = .inIntro
    @State var score : Int = 0
    
    var body: some View {

        GeometryReader { proxy in
            let size = proxy.size

            if endAnimation {
                switch currentMode {
                    
                    // homepage
                    case .inIntro:
                        IntroView(screentSize: size, currentMode: $currentMode)
                    
                    // explore more
                    case .inExplore:
                        ExploreView(screentSize: size, currentMode: $currentMode)
                    
                    // tutorial
                    case .inStep:
                        HomeView(screentSize: size, currentMode: $currentMode)
                    
                    // game page
                    case .inGame:
                        GameView(screentSize: size, currentMode: $currentMode, score: $score)
                    
                    // result page
                    default:
                        AboutView(screentSize: size, currentMode: $currentMode, score: $score)
                }
            } else {
                SplashScreen(endAnimation: $endAnimation, currentMode: $currentMode)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

