//
//  AboutView.swift
//  PaperCutGame
//
//  Created by Beking on 1/17/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        HStack(spacing: 0) {
            
            VStack {
                
                Image("congrats")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("About the Game")
                    .font(.title.bold())
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
                Text("🎉🎉🎉").font(.title3)
                
                Text("Congratulations, completed all levels!")
                    .font(.title3.bold())
                    .foregroundColor(Color("Red"))
                
                
                Text("If you have paper, a pen, and a scissor, why not give it a try? Let this game inspire you to boldly embark on your own paper cutting creations! \n\nReaching the end of the Chinese Paper Cutting Game, I'm honored to share the beauty of this art with you. Looking forward to your ongoing interest in this cultural heritage.")
                    .font(.title3)
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                
                Image("end")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Thank you :)")
                    .font(.title2.bold())
                    .foregroundColor(Color("Red"))
                
                Spacer()
                
                VStack{
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

#Preview {
    AboutView()
}
