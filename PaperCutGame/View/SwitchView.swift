//
//  SwitchView.swift
//  PaperCutGame
//
//  Created by Beking on 1/15/24.
//

import SwiftUI

struct SwitchView<HeadContent: View, MainContent: View, FootContent: View>: View {
    
    var screentSize : CGSize
    
    let headContent: () -> HeadContent
    let mainContent: () -> MainContent
    let footContent: () -> FootContent
    
    @State var offset : CGFloat = 0
    
    var body: some View {
        NavigationView {
            VStack {
                
                // head
                headContent()
                
                Spacer()
                
                // content
                OffsetPageTabView(offset: $offset) {
                    HStack(spacing: 0) {
                        mainContent()
                    }
                }
                
                Spacer()
                
                // foot
                footContent()
            }
            .background(Color("Background"))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .animation(.easeOut,value: getIndex())
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
        }
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
    
    
    func getIndicatorOffset() -> CGFloat {
        let progress = offset / screentSize.width
        let maxWidth : CGFloat = 12 + 7
        return progress * maxWidth
    }
    
    func getIndex() -> Int {
        let progress = round(offset / screentSize.width)
        let index = min(Int(progress), steps.count - 1)
        return index
    }
}

