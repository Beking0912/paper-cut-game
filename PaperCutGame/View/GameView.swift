//
//  GameView.swift
//  PaperCutGame
//
//  Created by Beking on 1/14/24.
//

import SwiftUI

struct GameView: View {
    
    var screentSize : CGSize
    
    @Binding var currentMode: GameMode
    @Binding var score:Int
    
    @State var roundNumber : Int = 0
   
    @State private var selectedAnswer: Int? = nil
    @State private var showNextButton: Bool = false
    @State private var isPopupPresented = false
        
    var body: some View {
        
        HStack(spacing: 0) {
                VStack {
                    HStack {
                        Text("ROUND \(GameInfos[roundNumber].round)")
                            .font(.largeTitle.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        Button {
                            currentMode = .inIntro
                        } label: {
                            Image(systemName: "house.fill").foregroundColor(.white)
                        }
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color("Green"), in: Circle())
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                    
                    HStack {
                        Text("Difficulty:")
                            .font(.system(.subheadline, design: .rounded))
                        
                        Text(GameInfos[roundNumber].difficulty)
                            .font(.system(.subheadline, design: .rounded))
                            .foregroundColor(Color("DarkRed"))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    
                    Spacer()

                    Image(GameInfos[roundNumber].paperImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screentSize.width)
                            
                    Spacer()
                    
                    Image(GameInfos[roundNumber].mainImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: screentSize.height / 3)
                            
                    Text("Guess what the paper unfolds into?\nClick your answer below.")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                            
                    HStack(spacing: 20) {
                        ForEach(0..<GameInfos[roundNumber].optionImages.count, id: \.self) { index in
                            Button(action: {
                                self.selectedAnswer = index
                                self.showNextButton = true
                                isPopupPresented.toggle()
                            }) {
                                Image(GameInfos[roundNumber].optionImages[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: (screentSize.width - 50) / 3)
                                    .border(.gray, width: self.selectedAnswer == index ? 2 : 0)
                            }
                        }
                    }.padding(.vertical, 5)
                                
                    Spacer()
                    
                }.overlay(
                    isPopupPresented ?
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                            .overlay(
                                PopupView(
                                    screentSize: screentSize,
                                    finished: self.roundNumber == (GameInfos.count - 1),
                                    points: self.selectedAnswer == GameInfos[roundNumber].correctAnswer
                                        ? "+\(GameInfos[roundNumber].score) pts 🎉"
                                        : "+0 pts 😔",
                                    message: self.selectedAnswer == GameInfos[roundNumber].correctAnswer
                                        ? "Awesome! Correct answer!"
                                        : "Oops! Not quite there.",
                                    onNext: {
                                        isPopupPresented.toggle()
                                        
                                        if self.selectedAnswer == GameInfos[roundNumber].correctAnswer {
                                            score += GameInfos[roundNumber].score
                                        }
                                        
                                        if self.roundNumber != (GameInfos.count - 1) {
                                            self.roundNumber = min(self.roundNumber + 1, GameInfos.count - 1)
                                            self.selectedAnswer = nil
                                            self.showNextButton = false
                                        } else {
                                            currentMode = .inResult
                                        }
                                    },
                                    onClose: {
                                        isPopupPresented.toggle()
                                    }
                                )
                                    .alignmentGuide(HorizontalAlignment.center) { d in
                                        d[HorizontalAlignment.center]
                                    }
                                    .alignmentGuide(VerticalAlignment.center) { d in
                                        d[VerticalAlignment.center]
                                    }
                            )
                        : nil
                )
        }
        .background(Color("Background"))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}


struct PopupView: View {
    var screentSize : CGSize
    var finished: Bool
    var points: String
    var message: String
        
    var onNext: () -> Void
    var onClose: () -> Void
    

    var body: some View {
        VStack {
            Text(points)
                .font(.largeTitle.bold())
                .foregroundColor(Color("Green"))
                .padding(.bottom, 5)
                        
            Text(message)
                .font(.title3)
//                .fontWeight(.semibold)

            
            Spacer()
            
            
            HStack(alignment:.bottom, spacing: 20) {
                Button("Try Again") {
                    onClose()
                }
                .font(.title3.bold())
                .foregroundColor(.white)
                .padding(15)
                .background(
                    Color("Blue"),
                    in: RoundedRectangle(cornerRadius: 15)
                )
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color("Blue"), lineWidth: 2)
//                )
                
                

                Button(finished ? "See Result" : "Next Round") {
                    onNext()
                }
                .font(.title3.bold())
                .foregroundColor(.white)
                .padding(15)
                .background(
                    Color("Green"),
                    in: RoundedRectangle(cornerRadius: 15)
                )
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color("Green"), lineWidth: 2)
//                )
            }
        }
        .padding()
        .frame(width: screentSize.width - 80, height: screentSize.height / 4)
        .background(Color("Background"))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

