//
//  SplashScreen.swift
//  PaperCutGame
//
//  Created by Beking on 1/14/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @Binding var endAnimation : Bool
    @Binding var currentMode: GameMode
    
    @State var startAnimation : Bool = false
    @State var circleAnimation1 : Bool = false
    @State var circleAnimation2 : Bool = false
    
    var body: some View {
        ZStack {
            Color("Blue")
            
            Group {
                SplashShape()
                    .trim(from: 0, to: startAnimation ? 1 : 0)
                    .stroke(.white, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                
                
                Text("✏️")
                    .font(.largeTitle.bold())
                    .scaleEffect(circleAnimation1 ? 1 : 0)
                    .offset(x: -110, y: 0)
                
                
                Text("✂️")
                    .font(.largeTitle.bold())
                    .scaleEffect(circleAnimation2 ? 1 : 0)
                    .offset(x: 110, y: 0)
                
                
                Image("snowflake")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .offset(x: 0, y: -90)
            }
            .frame(width: 220, height: 130)
            .scaleEffect(endAnimation ? 0.15 : 0.9)
            .rotationEffect(.init(degrees: endAnimation ? 85 : 0))
            
            
            Text("Paper Cutting \nGame")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            // foot
            VStack{
                Text("Powered by")
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Text("Biqing Su")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .frame(maxHeight: .infinity,alignment: .bottom)
            .foregroundColor(.white)
            .padding(.bottom,getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
            .opacity(startAnimation ? 1 : 0)
            .opacity(endAnimation ? 0 : 1)
        }
        .offset(y: endAnimation ? (-getRect().height * 1.5) : 0)
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.spring().delay(0.15)) {
                circleAnimation1.toggle()
            }
            
            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.05, blendDuration: 1.05).delay(0.3)) {
                startAnimation.toggle()
            }
            
            withAnimation(.spring().delay(0.7)) {
                circleAnimation2.toggle()
            }
            
            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.05, blendDuration: 1.05).delay(1.2)) {
                endAnimation.toggle()
                
                if endAnimation == true {
                    currentMode = .inIntro
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View{
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}

struct SplashShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let mid = rect.width / 2
            path.addArc(center: CGPoint(x: mid , y: 0), radius: mid, startAngle: .init(degrees: -180), endAngle: .zero, clockwise: false)
        }
    }
}

