//
//  AboutView.swift
//  PaperCutGame
//
//  Created by Beking on 1/17/24.
//

import SwiftUI

struct AboutView: View {
    var screentSize : CGSize
    
    @Binding var currentMode: GameMode
    @Binding var score:Int
    
    var body: some View {
        HStack(spacing: 0) {
                        
            VStack {
                Image("score")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screentSize.width)
                    .padding(.top, 20)
        
                
                Text("\(score) pts")
                    .font(.largeTitle.bold())
                    .foregroundColor(.black)
                    .offset(y: -90)


                
                Button("Play Again") {
                    currentMode = .inGame
                    score = 0
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
                .onTapGesture {
                    currentMode = .inGame
                    score = 0
                }
                

                
                Button("Explore More") {
                    currentMode = .inExplore
                    score = 0
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
                .padding()
                .onTapGesture {
                    currentMode = .inExplore
                    score = 0
                }
                
                
                
                Button("Back to Home") {
                    currentMode = .inIntro
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
                .onTapGesture {
                    currentMode = .inIntro
                }
                
                

                VStack {
                    Text("If you have paper, a pen, and a scissor, why not give it a try? Looking forward to your ongoing interest in Chinese paper cutting.")
                        .font(.callout)
                        .padding(20)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text("Powered by")
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text("Biqing Su")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .background(Color("Background"))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}


struct About_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
