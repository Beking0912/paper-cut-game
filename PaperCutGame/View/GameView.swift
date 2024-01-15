//
//  GameView.swift
//  PaperCutGame
//
//  Created by Beking on 1/14/24.
//

import SwiftUI

struct GameView: View {
    
    var screentSize : CGSize
    
    @State var roundNumber : Int = 0
   
    @State private var selectedAnswer: Int? = nil
    @State private var showNextButton: Bool = false
                
    var body: some View {
        
        HStack(spacing: 0) {
                VStack {
                    Text("ROUND \(GameInfos[roundNumber].round)")
                        .font(.title.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                            
                    HStack {
                        Text("Difficulty:")
                            .font(.system(.subheadline, design: .rounded))
                        
                        Text(GameInfos[roundNumber].difficulty)
                            .font(.system(.subheadline, design: .rounded))
                            .foregroundColor(Color("Red"))
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
                            
                    Text("Guess what the paper cutout unfolds into?")
                        .font(.system(.headline, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                            
                    HStack(spacing: 20) {
                        ForEach(0..<GameInfos[roundNumber].optionImages.count, id: \.self) { index in
                            Button(action: {
                                self.selectedAnswer = index
                                self.showNextButton = true
                            }) {
                                Image(GameInfos[roundNumber].optionImages[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: (screentSize.width - 50) / 3)
                                    .border(.gray, width: self.selectedAnswer == index ? 2 : 0)
                            }
                        }
                    }.padding(.vertical, 5)
                    
                    Button {
                        if goNextRound(
                            showNextButton: showNextButton,
                            selectedAnswer: self.selectedAnswer,
                            correctAnswer: GameInfos[roundNumber].correctAnswer
                        ) {
                            if self.roundNumber != (GameInfos.count - 1) {
                                self.roundNumber = min(GameInfos[roundNumber].round + 1, GameInfos.count - 1)
                                self.selectedAnswer = nil
                                self.showNextButton = false
                            }
                        }
                    } label: {
                        Text(!showNextButton ? " "
                             : self.selectedAnswer == GameInfos[roundNumber].correctAnswer
                             ? self.roundNumber != (GameInfos.count - 1)
                             ? "👍 Amazing! Completed all levels!"
                             : "🎉 Congratulations! Next round!"
                             : "😊 Sorry, maybe try another one."
                        )
                        .font(.title2.bold())
                        .foregroundColor(
                            self.selectedAnswer == GameInfos[roundNumber].correctAnswer
                            ? .green
                            : .red
                        )
                        .padding(20)
                    }
                }
        }
        .background(Color("Background"))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
    func goNextRound(showNextButton: Bool, selectedAnswer: Int?, correctAnswer: Int) -> Bool {
        if showNextButton && selectedAnswer == correctAnswer {
            return true
        }
        return false
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

