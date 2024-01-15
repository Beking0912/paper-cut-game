//
//  ContentView.swift
//  PaperCutGame
//
//  Created by Beking on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var endAnimation : Bool = false
    
    var body: some View {
        
//        GameView()
        
                    GeometryReader { proxy in
                        let size = proxy.size
                        GameView(screentSize: size)
                    }

//        if endAnimation {
//            GeometryReader { proxy in
//                let size = proxy.size
//                HomeView(screentSize: size)
//            }
//        } else {
//            SplashScreen(endAnimation: $endAnimation)
//        }
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

