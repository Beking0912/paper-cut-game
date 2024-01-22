//
//  SwitchView.swift
//  PaperCutGame
//
//  Created by Beking on 1/15/24.
//

import SwiftUI

struct SwitchView<HeadContent: View, MainContent: View, FootContent: View>: View {
    
    var screentSize : CGSize
    var count: Int
    var indexButtonType: String
    var showProgress: Bool
    
    @Binding var currentMode: GameMode
    
    let headContent: () -> HeadContent
    let mainContent: () -> MainContent
    let footContent: () -> FootContent
    
    @State var offset : CGFloat = 0
    
    var body: some View {
            VStack {
                
                headContent()

                if showProgress {
                    Text("\(getIndex() + 1) / \(count)").font(.headline)
                }
                
                Spacer()
                
                VStack(spacing: 0) {
                    OffsetPageTabView(offset: $offset) {
                        HStack(spacing: 0) {
                            mainContent()
                        }
                    }
                    
                    if indexButtonType == "circle" {
                        HStack {
                            Button{
                                let index = max(getIndex() - 1, 0)
                                offset = CGFloat(index) * (screentSize.width - 20)
                            } label: {
                                Image(systemName: "chevron.left")
                                    .font(.title3)
                                    .foregroundColor(.white)
                            }
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(15)
                            .background(Color("Blue"), in: Circle())
                            .padding()
                            
                            
                            
                            Button {
                                currentMode = .inIntro
                            } label: {
                                Image(systemName: "house.fill").foregroundColor(.white)
                            }
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(15)
                            .background(Color("Green"), in: Circle())
                            .padding()
                            
                            
                            
                            
                            Button {
                                let index = min(getIndex() + 1, count - 1)
                                offset = CGFloat(index) * (screentSize.width - 20)
                            } label: {
                                Image(systemName: "chevron.right")
                                    .font(.title3)
                                    .foregroundColor(.white)
                            }
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(15)
                            .background(Color("Blue"), in: Circle())
                            .padding()
                        }
                    }
                }
               
                Spacer()
                
                if indexButtonType == "dot" {
                    HStack(alignment:.bottom) {
                        
                        // left index
                        HStack(spacing: 12) {
                            ForEach(steps.indices, id: \.self) { index in
                                Capsule()
                                    .fill(.black)
                                    .frame(width: getIndex() == index ? 20 : 7, height: 7)
                            }
                        }
                        .overlay(
                            Capsule()
                                .fill(.black)
                                .frame(width: 20, height: 7)
                                .offset(x: getIndicatorOffset())
                            ,alignment: .leading
                        )
                        .offset(x: 10, y: -15)
                        
                        Spacer()
                        
                        // right button
                        if getIndex() == steps.count - 1 {
                            Button  {
                                currentMode = .inGame
                            } label: {
                                Text("Start Game!")
                                    .font(.title2.bold())
                                    .foregroundColor(.white)
                                    .padding(20)
                                    .background(
                                        steps[getIndex()].color,
                                        in: RoundedRectangle(cornerRadius: 30)
                                    )
                            }
                        } else {
                            Button  {
                                let index = min(getIndex() + 1, steps.count - 1)
                                offset = CGFloat(index) * screentSize.width
                            } label: {
                                Image(systemName: "chevron.right")
                                    .font(.title2.bold())
                                    .foregroundColor(.white)
                                    .padding(20)
                                    .background(steps[getIndex()].color, in: Circle())
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                footContent()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .animation(.easeOut, value: getIndex())
    }
    
    
    func getIndicatorOffset() -> CGFloat {
        let progress = offset / (screentSize.width - 20)
        let maxWidth : CGFloat = 12 + 7
        return progress * maxWidth
    }
    
    func getIndex() -> Int {
        let progress = round(offset / (screentSize.width - 20))
        let index = min(Int(progress), count - 1)
        return index
    }
}


struct Switch_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
