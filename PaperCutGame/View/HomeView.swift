//
//  HomeView.swift
//  PaperCutGame
//
//  Created by Beking on 1/12/24.
//

import SwiftUI

struct HomeView: View {
    
    var screentSize : CGSize
    
    @Binding var currentMode: GameMode
        
    var body: some View {
            VStack {
                
                
                SwitchView(
                    screentSize: screentSize,
                    count: steps.count,
                    indexButtonType: "dot",
                    showProgress: false,
                    currentMode: $currentMode
                ) {
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
                        
                        Spacer()
                        
                        Button {
                            currentMode = .inIntro
                        } label: {
                            Image(systemName: "house.fill").foregroundColor(.white)
                        }
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color("Blue"), in: Circle())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                } mainContent: {
                    
                    ForEach(steps) { step in
                        VStack {
                            Image(step.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: screentSize.height / 3)
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Text(step.title)
                                    .font(.largeTitle.bold())
                                    .foregroundColor(.black)
                                
                                Text(step.description)
                                    .font(.title3)
                                    .foregroundColor(.black)
                            }
                            .padding(.top, 60)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                        .frame(width: screentSize.width)
                    }
                    
                } footContent: {
                    EmptyView()
                }
                .frame(width: screentSize.width, height: screentSize.height)
            }
            .background(Color("Background"))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

