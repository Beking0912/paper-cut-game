//
//  AboutView.swift
//  PaperCutGame
//
//  Created by Beking on 1/17/24.
//

import SwiftUI

struct AboutView: View {
    
    @Binding var inGame: Bool
    @Binding var score:Int
    
    var body: some View {
        HStack(spacing: 0) {
                        
            VStack {
                
                Image("congrats")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                Text("🎉🎉🎉").font(.title3)
                Text("You've won \(score) points!")
                    .font(.title.bold())
                    .foregroundColor(Color("Red"))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
//                Text("🎉🎉🎉").font(.title3)
                
//                Text("Congratulations, completed all levels!")
//                    .font(.title3.bold())
//                    .foregroundColor(Color("Red"))
                
                
                Text("If you have paper, a pen, and a scissor, why not give it a try?\n\nLooking forward to your ongoing interest in Chinese paper cutting.")
                    .font(.title3)
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                
                Button("Play Again") {
                    inGame = true
                    score = 0
                }
                .font(.title3.bold())
                .foregroundColor(.white)
                .padding(15)
                .background(
                    .green,
                    in: RoundedRectangle(cornerRadius: 15)
                )
                
//                Image("end")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                
//                Text("Thank you :)")
//                    .font(.title2.bold())
//                    .foregroundColor(Color("Red"))
                
                Spacer()
                
                VStack {
                    Text("Powered by")
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text("Biqing Su")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .foregroundColor(.black)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
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
