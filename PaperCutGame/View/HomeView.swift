//
//  HomeView.swift
//  PaperCutGame
//
//  Created by Beking on 1/12/24.
//

import SwiftUI

struct HomeView: View {
    
    var screentSize : CGSize
    @State var offset : CGFloat = 0
    
    var body: some View {
        VStack {
            
            // head
            Button  {
            } label: {
                Image("snowflake")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color("Blue"))
                    .frame(width: 30, height: 30)
                
                Text("Snowflake Paper Cutting Process")
                    .foregroundColor(.black)
                    .font(.subheadline.bold())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Spacer()
            
            // content
            OffsetPageTabView(offset: $offset) {
                HStack(spacing: 0) {
                    ForEach(intros) { intro in
                        VStack {
                            Image(intro.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: screentSize.height / 3)
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Text(intro.title)
                                    .font(.largeTitle.bold())
                                
                                Text(intro.description)
                                    .font(.title3.bold())
                                    .foregroundColor(.primary)
                            }
                            .padding(.top, 60)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                        .frame(width: screentSize.width)
                    }
                }
            }
            
            Spacer()
            
            // foot
            HStack(alignment:.bottom) {
                HStack(spacing: 12) {
                    ForEach(intros.indices, id:\.self) { index in
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
                
                Button  {
                    let index = min(getIndex() + 1, intros.count - 1)
                    offset = CGFloat(index) * screentSize.width
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(20)
                        .background(
                            intros[getIndex()].color,
                            in: Circle()
                        )
                }
            }.padding(.horizontal, 20)
        }
        .background(Color("Background"))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .animation(.easeOut,value: getIndex())
    }
    
    
    func getIndicatorOffset() -> CGFloat {
        let progress = offset / screentSize.width
        let maxWidth : CGFloat = 12 + 7
        return progress * maxWidth
    }
    
    func getIndex() -> Int {
        let progress = round(offset / screentSize.width)
        let index = min(Int(progress), intros.count - 1)
        return index
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

