//
//  SocialHighlights2Floating.swift
//  MatterProto
//
//  Created by Nicolas Machado on 1/19/21.
//

import SwiftUI

struct SocialHighlights2Floating: View {
    
    @State private var barOpacity0: Double = 0
    @State private var barOpacity1: Double = 0
    @State private var barOpacity2: Double = 0
    @State private var barOpacity3: Double = 0
    @State private var barOpacity4: Double = 0
    @State private var barOpacity5: Double = 0
    
    @State private var isAnimateBar: Bool = false
    @State private var shouldShowIcon5: Bool = true
    @State private var loopIconsFF: Bool = false
    @State private var neverShowIconsAgain: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                ZStack(alignment: .leading) {
                    highlights
                    mainContent
                    icons
                }
                .padding(.bottom, 60)
            }
            if isAnimateBar {
                bottomBar
            }
        }
    }
    
    var Y_0 :CGFloat = -957
    var Y_1 :CGFloat = -675 //130 diff
    var Y_2 :CGFloat = -393
    var Y_3 : CGFloat = 20
    var Y_4 : CGFloat = 227
    var Y_5 : CGFloat = 1200
    
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
            Highlight(yVal: Y_0, w1: 360, w2: 380)
            Highlight(yVal: Y_1, w1: 330, w2: 355)
            Highlight(yVal: Y_2, w1: 340, w2: 295)
            Highlight(yVal: Y_3, w1: 330, w2: 350)
            Highlight(yVal: Y_4, w1: 340, w2: 360)
            Highlight(yVal: Y_5, w1: 295, w2: 170)
        }
    }
    
    private var icons: some View {
        ZStack(alignment: .leading){
            icon0
            icon1
            icon2
            icon3
            icon4
            icon5
            
            
        }
    }
    
    struct Highlight: View {
        var yVal: CGFloat
        var w1: CGFloat
        var w2: CGFloat
        
        var body: some View {
            VStack(alignment: .leading) {
                Rectangle()
                    .frame(width: w1,height: 26)
                    .foregroundColor(HIGHLIGHT_COLOR)
                    .offset(x: X_OFFSET, y: yVal + 10)
                    .opacity(0.6)
                Rectangle()
                    .frame(width: w2,height: 26)
                    .foregroundColor(HIGHLIGHT_COLOR)
                    .opacity(0.6)
                    .offset(x: X_OFFSET, y: yVal)
            }
        }
    }
    
    
    private var icon0: some View {
        GeometryReader { g -> AnyView in
            let rect = g.frame(in: .global)
            //print("0 - \(rect.maxY)")
            DispatchQueue.main.async {
                if rect.maxY < 485.75 && rect.maxY > 275.75 {
                    
                    var diff = abs(rect.maxY - 380.75)
                    var val = 1 - (diff / 90.5)
                    if val > 0.2 {
                        val = val * 2
                    }
                    self.barOpacity0 = Double(val)
                    
                }
                else {
                    self.barOpacity0 = 0
                }
                
                if self.neverShowIconsAgain {
                    self.barOpacity0 = 0
                }
                
                if rect.maxY > 485.75 {
                    isGoingDown0 = true
                }
                if rect.maxY < 275.75 {
                    isGoingDown0 = false
                }
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
                //print("1 - \(rect.maxY)")
                if rect.maxY < 485.75 && rect.maxY > 275.75 {
                    if isGoingDown1 == false {
                        self.barOpacity1 = 0
                    }
                    else {
                        var diff = abs(rect.maxY - 380.75)
                        var val = 1 - (diff / 90.5)
                        if val > 0.2 {
                            val = val * 2
                        }
                        self.barOpacity1 = Double(val)
                    }
                }
                else {
                    self.barOpacity1 = 0
                }
                
                if self.neverShowIconsAgain {
                    self.barOpacity1 = 0
                }
                if rect.maxY > 485.75 {
                    isGoingDown1 = true
                }
                if rect.maxY < 275.75 {
                    isGoingDown1 = false
                }
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
    
    private var icon2: some View {
        GeometryReader { g -> AnyView in
            let rect = g.frame(in: .global)
            DispatchQueue.main.async {
                //print("2 - \(rect.maxY)")
                if rect.maxY < 485.75 && rect.maxY > 275.75 {
                    if isGoingDown2 == false {
                        self.barOpacity2 = 0
                    }
                    else {
                        var diff = abs(rect.maxY - 380.75)
                        var val = 1 - (diff / 90.5)
                        if val > 0.2 {
                            val = val * 2
                        }
                        self.barOpacity2 = Double(val)
                    }
                }
                else {
                    self.barOpacity2 = 0
                }
                
                if self.neverShowIconsAgain {
                    self.barOpacity2 = 0
                }
                
                if rect.maxY > 485.75 {
                    isGoingDown2 = true
                }
                if rect.maxY < 275.75 {
                    isGoingDown2 = false
                }
            }
            return AnyView(Image("facePic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.5)
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .opacity(barOpacity2)
                           
            )
        }
        .frame(height: 0)
        .offset(x: 360, y: Y_2 + 35)
    }
    
    private var icon3: some View {
        GeometryReader { g -> AnyView in
            let rect = g.frame(in: .global)
            DispatchQueue.main.async {
                if rect.maxY < 485.75 && rect.maxY > 275.75 {
                    if isGoingDown3 == false {
                        self.barOpacity3 = 0
                    }
                    else {
                        var diff = abs(rect.maxY - 380.75)
                        var val = 1 - (diff / 90.5)
                        if val > 0.2 {
                            val = val * 2
                        }
                        self.barOpacity3 = Double(val)
                    }
                }
                else {
                    self.barOpacity3 = 0
                }
                
                if self.neverShowIconsAgain {
                    self.barOpacity3 = 0
                }
                
                if rect.maxY > 485.75 {
                    isGoingDown3 = true
                }
                if rect.maxY < 275.75 {
                    isGoingDown3 = false
                }
            }
            return AnyView(Image("facePic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.5)
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .opacity(barOpacity3)
                           
            )
        }
        .frame(height: 0)
        .offset(x: 360, y: Y_3 + 35)
    }
    
    private var icon4: some View {
        GeometryReader { g -> AnyView in
            let rect = g.frame(in: .global)
            DispatchQueue.main.async {
                if rect.maxY < 485.75 && rect.maxY > 275.75 {
                    if isGoingDown4 == false {
                        self.barOpacity4 = 0
                    }
                    else {
                        var diff = abs(rect.maxY - 380.75)
                        var val = 1 - (diff / 90.5)
                        if val > 0.2 {
                            val = val * 2
                        }
                        self.barOpacity4 = Double(val)
                    }
                }
                else {
                    self.barOpacity4 = 0
                }
                
                if self.neverShowIconsAgain {
                    self.barOpacity4 = 0
                }
                
                if rect.maxY > 485.75 {
                    isGoingDown4 = true
                }
                if rect.maxY < 275.75 {
                    isGoingDown4 = false
                }
            }
            return AnyView(Image("facePic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.5)
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .opacity(barOpacity4)
                           
            )
        }
        .frame(height: 0)
        .offset(x: 360, y: Y_4 + 35)
    }
    
    private var icon5: some View {
        GeometryReader { g -> AnyView in
            let rect = g.frame(in: .global)
            print("5 - \(rect.maxY)")
            DispatchQueue.main.async {
                
                //turn on nav bar
                if rect.maxY <= 808.0 {
                    self.isAnimateBar = true
                    self.shouldShowIcon5 = false
                    if self.loopIconsFF {
                        self.neverShowIconsAgain = true
                    }
                }
                if rect.maxY >= 890 {
                    self.isAnimateBar = false
                    self.shouldShowIcon5 = true
                }
                
                if rect.maxY < 485.75 && rect.maxY > 275.75 {
                    if isGoingDown5 == false {
                        self.barOpacity5 = 0
                    }
                    else {
                        var diff = abs(rect.maxY - 380.75)
                        var val = 1 - (diff / 90.5)
                        if val > 0.2 {
                            val = val * 2
                        }
                        self.barOpacity5 = Double(val)
                    }
                }
                else {
                    self.barOpacity5 = 0
                }
                
                if self.neverShowIconsAgain {
                    self.barOpacity1 = 0
                }
                
                self.barOpacity5 = 1
                if rect.maxY > 485.75 {
                    isGoingDown5 = true
                }
                if rect.maxY < 275.75 {
                    isGoingDown5 = false
                }
            }
            return AnyView(Image("facePic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.5)
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .animation(.easeOut(duration: 3))
                            .opacity(shouldShowIcon5 ? 1.0 : 0.0)
                           
            )
        }
        .frame(height: 0)
        .offset(x: 360, y: Y_5 + 35)
    }
    
    
    
    
    private var mainContent: some View {
        
        
        VStack (alignment: .leading) {
            //these should be moved under body text so that there's no whitespace on top
            HStack {
                Rectangle()
                    .frame(width: 28,height: 28)
                    .foregroundColor(.black)
                    .cornerRadius(4.0)
                Text("Zeynep Tufekci")
                    .foregroundColor(Color.black)
                    .font(.system(size: 15, weight: .regular))
                Text("The Atlantic")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 15, weight: .regular))
            }
            Text("I Can’t Breathe: Braving Tear Gas in a Pandemic")
                .foregroundColor(Color.black)
                .font(.system(size: 26, weight: .heavy))
                .padding(.top, 10)
                .lineSpacing(3)
            Text("1d ago   16,320 words")
                .foregroundColor(Color.gray)
                .font(.system(size: 15, weight: .regular))
                .padding(.top, 10)
                .padding(.bottom, 26)
            
            Text(BODY_TXT)
                .font(.custom("Bookerly", size: 18))
                //.padding(.horizontal, 20)
                .lineSpacing(5)
        }
        .padding(.horizontal, 20)
        .padding(.top, 71)
        
        
    }
    
}

//struct Icon: View {
//        var yVal: CGFloat
//        @Binding var barOpacity: Double
//        @Binding var isGoingDown: Bool
//        var body: some View {
//            GeometryReader { g -> AnyView in
//                let rect = g.frame(in: .global)
//                print("0 - \(rect.maxY)")
//                DispatchQueue.main.async {
//                    if rect.maxY < 485.75 && rect.maxY > 275.75 {
//
//                        var diff = abs(rect.maxY - 380.75)
//                        var val = 1 - (diff / 90.5)
//                        if val > 0.2 {
//                            val = val * 2
//                        }
//                        self.barOpacity = Double(val)
//
//                    }
//                    else {
//                        self.barOpacity = 0
//                    }
//                    if rect.maxY > 485.75 {
//                        self.isGoingDown = true
//                    }
//                    if rect.maxY < 275.75 {
//                        self.isGoingDown = false
//                    }
//                }
//                return AnyView(Image("facePic")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 30, height: 30)
//                                .clipShape(Circle())
//                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.5)
//                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
//                                .opacity(barOpacity)
//
//                )
//            }
//            .frame(height: 0)
//            .offset(x: 360, y: yVal + 35)
//        }
//    }
//

struct SocialHighlights2Floating_Previews: PreviewProvider {
    static var previews: some View {
        SocialHighlights2Floating()
    }
}



//Constants
var isGoingDown0 : Bool = true
var isGoingDown1 : Bool = true
var isGoingDown2 : Bool = true
var isGoingDown3 : Bool = true
var isGoingDown4 : Bool = true
var isGoingDown5 : Bool = true


