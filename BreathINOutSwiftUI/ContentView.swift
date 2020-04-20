//
//  ContentView.swift
//
//  Created by Arvind on 27/1/20.
//  Copyright © 2020 Arvind. All rights reserved.
//
//====== Thank you foe your support Guys ===== (Arvind Patel)

import SwiftUI

struct ContentView: View {
    @State var breath: Bool = false
    @State var textChange: Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black, Color.black]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
                .scaleEffect(1.2)
            ZStack {
                ZStack {
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), center: .center, startRadius: 5, endRadius: 100)
                            .clipShape(Circle()).frame(width: 80, height: 80)
                            .offset(y: -41.0)
                    }
                    
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), center: .center, startRadius: 5, endRadius: 90)
                            .clipShape(Circle()).frame(width: 80, height: 80)
                            .offset(y: 41.0)
                    }
                }.opacity(0.5)
                
                ZStack {//60 Degree
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), center: .center, startRadius: 5, endRadius: 100)
                            .clipShape(Circle()).frame(width: 80, height: 80)
                            .offset(y: -41.0)
                    }
                    
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), center: .center, startRadius: 5, endRadius: 90)
                            .clipShape(Circle()).frame(width: 80, height: 80)
                            .offset(y: 41.0)
                    }
                }.opacity(0.5).rotationEffect(Angle(degrees: 60), anchor: .center)
                
                ZStack {//60 * 2 Degree
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), center: .center, startRadius: 5, endRadius: 100)
                            .clipShape(Circle()).frame(width: 80, height: 80)
                            .offset(y: -41.0)
                    }
                    
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), center: .center, startRadius: 5, endRadius: 90)
                            .clipShape(Circle()).frame(width: 80, height: 80)
                            .offset(y: 41.0)
                    }
                }.opacity(0.5).rotationEffect(Angle(degrees: 60 * 2), anchor: .center)
            }
            .rotationEffect(Angle.degrees(breath ? 360 : 0))
            .scaleEffect(breath ? 2.0 : 0.2)
            .animation(Animation.easeOut(duration: 4).delay(1.0).repeatForever())
            .opacity(breath ? 1.0 : 0.5)
            .onAppear() {self.breath.toggle()}
            
            Circle()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(.green)
                .scaleEffect(breath ? 0.6 : 1.4)
                .opacity(breath ? 0 : 1)
                .blendMode(.hardLight)
                .animation(Animation.easeOut(duration: 4).delay(1.0).repeatForever())
            
            
            Text(textChange ? "Breath In" : "Breath Out")
                .animation(Animation.easeInOut(duration: 0.01))
                .foregroundColor(.white)
                .onAppear(perform: toggleTexxtChange)
                .scaleEffect(textChange ? 2.5 : 1.0)
                .animation(Animation.easeOut(duration: 4).delay(1.0).repeatForever(autoreverses: true))
            
                
            
        }
        
        
    }
    func toggleTexxtChange() {
        self.textChange.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.toggleTexxtChange()
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
