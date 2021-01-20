//
//  SocialHighlights2NavMode.swift
//  MatterProto
//
//  Created by Nicolas Machado on 1/19/21.
//

import SwiftUI

struct SocialHighlights2NavMode: View {
    @State private var barOpacity0: Double = 1
    @State private var barOpacity1: Double = 1
    
    @State private var showingNav = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            ScrollView {
                ZStack(alignment: .leading) {
                    highlights
                    mainContent
                }
                .padding(.bottom, 60)
            }
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        self.showingNav.toggle()
                        print("TAPPED")
                        print("Showing nav: \(showingNav)")
                    }
            )
            
            if showingNav {
                Icon(yVal: -65)
                Icon(yVal: 217)
                
                bottomBar
                
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 86,height: 28)
                        .foregroundColor(.white)
                        .offset(x: 50)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.5)
                    Text("3")
                        .foregroundColor(FONT_GRAY_COLOR)
                        .font(.system(size: 15, weight: .bold))
                        .offset(x: 43)
                    Circle()
                        .frame(width: 15,height: 15)
                        .foregroundColor(FONT_GRAY_COLOR)
                        .offset(x: 25)
                }
                .offset(x: 310, y: -335)
            }
        }
        .animation(.easeInOut(duration: 0.3))
    }
    
    
    var Y_0 :CGFloat = -952
    var Y_1 :CGFloat = -670 //130 diff
    
    struct Icon: View {
        var yVal: CGFloat
        
        var body: some View {
            Image("facePic")
                .resizable()
                .scaledToFit()
                .frame(width: 27, height: 27)
                .clipShape(Circle())
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.5)
                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                .offset(x: 377, y: yVal)
        }
    }
    
    private var bottomBar: some View {
        Rectangle()
            .frame(height: 89)
            .foregroundColor(.white)
            .border(Color.gray)
            .offset(y: 410)
            .transition(.move(edge: .bottom))
            .animation(.default)
    }
    
    private var highlights: some View {
        ZStack(alignment: .leading){
            
            //1
            Line(yVal: Y_0, width: 370)
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [2.5]))
                .frame(height: 1)
                .foregroundColor(UNDERLINE_COLOR)
            Line(yVal: Y_0 + 26, width: 395)
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [2.5]))
                .frame(height: 1)
                .foregroundColor(UNDERLINE_COLOR)
            
            //2
            
            Line(yVal: Y_1, width: 342)
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [2.5]))
                .frame(height: 1)
                .foregroundColor(UNDERLINE_COLOR)
            Line(yVal: Y_1 + 26, width: 372)
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [2.5]))
                .frame(height: 1)
                .foregroundColor(UNDERLINE_COLOR)
        }
    }
    
    private var icons: some View {
        ZStack(alignment: .leading){
            icon0
            icon1
        }
    }
    
    struct Line: Shape {
        var yVal: CGFloat
        var width: CGFloat
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: X_OFFSET + 5, y: yVal))
            path.addLine(to: CGPoint(x: width, y: yVal))
            return path
        }
    }
    
    
    private var icon0: some View {
        GeometryReader { g -> AnyView in
            let rect = g.frame(in: .global)
            //print("0 - \(rect.maxY)")
            DispatchQueue.main.async {
                self.barOpacity0 = 0
            }
            return AnyView(Image("facePic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.5)
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .opacity(barOpacity0)
                           
            )
        }
        .frame(height: 0)
        .offset(x: 360, y: Y_0 + 35)
    }
    
    
    private var icon1: some View {
        GeometryReader { g -> AnyView in
            let rect = g.frame(in: .global)
            DispatchQueue.main.async {
                self.barOpacity0 = 0
            }
            return AnyView(Image("facePic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.5)
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .opacity(barOpacity1)
                           
            )
        }
        .frame(height: 0)
        .offset(x: 360, y: Y_1 + 35)
    }
    
    private var mainContent: some View {
        
        
        VStack (alignment: .leading) {
            //these should be moved under body text so that there's no whitespace on top
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 86,height: 28)
                    .foregroundColor(.white)
                    .offset(x: 50)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.5)
                Text("3")
                    .foregroundColor(FONT_GRAY_COLOR)
                    .font(.system(size: 15, weight: .bold))
                    .offset(x: 43)
                Circle()
                    .frame(width: 15,height: 15)
                    .foregroundColor(FONT_GRAY_COLOR)
                    .offset(x: 25)
            }
            .padding(.bottom, 5)
            .offset(x: 290)
            .hidden()
            HStack {
                Rectangle()
                    .frame(width: 28,height: 28)
                    .foregroundColor(.black)
                    .cornerRadius(4.0)
                Text("Zeynep Tufekci")
                    .foregroundColor(FONT_GRAY_COLOR)
                    .font(.system(size: 15, weight: .regular))
                Text("The Atlantic")
                    .foregroundColor(FONT_LIGHTGRAY_COLOR)
                    .font(.system(size: 15, weight: .regular))
            }
            Text("I Can’t Breathe: Braving Tear Gas in a Pandemic")
                .foregroundColor(Color.black)
                .font(.system(size: 26, weight: .heavy))
                .padding(.top, 10)
                .lineSpacing(3)
            Text("1d ago   16,320 words")
                .foregroundColor(FONT_LIGHTGRAY_COLOR)
                .font(.system(size: 15, weight: .regular))
                .padding(.top, 10)
                .padding(.bottom, 26)
            
            Text(BODY_TXT)
                .font(.custom("Bookerly", size: 18))
                .foregroundColor(FONT_GRAY_COLOR)
                //.padding(.horizontal, 20)
                .lineSpacing(5)
        }
        .padding(.horizontal, 20)
        .padding(.top, 71)
        .offset(y: -20)
        
        
    }
}

struct SocialHighlights2NavMode_Previews: PreviewProvider {
    static var previews: some View {
        SocialHighlights2NavMode()
    }
}
