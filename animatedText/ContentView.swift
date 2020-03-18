//
//  ContentView.swift
//  animatedText
//
//  Created by keiren on 3/16/20.
//  Copyright © 2020 keiren. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let startAnimationDuration = 11.0
    private let endAnimationDuration = 1.5
    @State private var animationStart = false
    @State private var animationEnd = false
    
    
    var body: some View {
        Text("Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma - which is living with the results of other people's thinking. Don't let the noise of others' opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
            .fontWeight(.bold)
            .font(.title)
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .lineSpacing(10)
            .padding()
            .rotation3DEffect(.degrees(animationEnd ? 0 : 60), axis: (x: 1, y: 0, z:0))
            .shadow(color: .gray, radius: 2, x:0, y: 15)
            .frame(width: 300, height: animationStart ? 750 : 0)
            .animation(Animation.linear(duration: animationEnd ? endAnimationDuration : startAnimationDuration))
            .onAppear(){
                self.animationStart.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + self.startAnimationDuration){
                    self.animationEnd.toggle()
                }
                
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
