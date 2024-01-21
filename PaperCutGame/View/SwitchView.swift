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
    
    @Binding var inIntro: Bool
    @Binding var inExplore: Bool
    
    let headContent: () -> HeadContent
    let mainContent: () -> MainContent
    let footContent: () -> FootContent
    
    @State var offset : CGFloat = 0
    
    var body: some View {
            VStack {
                
                headContent()
                
                Spacer()
                
                VStack(spacing: 0) {
                    OffsetPageTabView(offset: $offset) {
                        HStack(spacing: 0) {
                            mainContent()
                        }
                    }
                    
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
                            inExplore = false
                            inIntro = true
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
                
//                OffsetPageTabView(offset: $offset) {
//                    HStack(spacing: 0) {
//                        mainContent()
//                    }
//                }
//                
                Spacer()
                
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
