//
//  ContentView.swift
//  Bullseye
//
//  Created by Xiaochun Shen on 2020/1/5.
//  Copyright © 2020 SXC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // Properties
    // ==========
    
    // User interface views
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    var sliderValueRounded: Int {
        Int(sliderValue.rounded())
    }
    @State var score = 0
    @State var round = 1
    var sliderTargetDifference: Int {
        abs(sliderValueRounded - target)
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                    .modifier(LabelStyle())
                Text("\(target)")
                    .modifier(ValueStyle())
            }
            
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                    .modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
                    .modifier(LabelStyle())
            }
            Spacer()
            
            
            // Button row
            Button(action: {
                self.alertIsVisible = true
               
            }) {
                Text("Hit me!")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.black)
            }
            .background(Image("Button"))
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            .alert(isPresented: $alertIsVisible) {
                Alert(title: Text(alertTitle()),
                      message: Text(scoringMessage()),
                      dismissButton: .default(Text("Awesome!")) {
                        self.startNewRound()
                }
                )
            }
            
            Spacer()
            
            // Score row
            // TODO: Add views for the score, rounds, and start and info buttons here.
            
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                    .modifier(LabelStyle())
                Text("\(score)")
                    .modifier(ValueStyle())
                Spacer()
                Text("Round:")
                    .modifier(LabelStyle())
                Text("\(round)")
                    .modifier(ValueStyle())
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
        
        .onAppear() {
            self.startNewGame()
        }
    .background(Image("Background"))
        
    }
    
    // Methods
    // =======
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let points: Int
        
        
        if sliderTargetDifference == 0 {
            points = 200
        } else if sliderTargetDifference == 1 {
            points = 150
        } else {
            points = maximumScore -  sliderTargetDifference
        }
        return points
        
    }
    
    func scoringMessage() -> String {
        return "The slider's value is \(self.sliderValueRounded).\n" +
        "The target value is \(target).\n" +
        "You scord \(pointsForCurrentRound()) points this round."
    }
    
    func alertTitle() -> String {
        let title: String
        if sliderTargetDifference == 0 {
            title = "Perfect!"
        } else if  sliderTargetDifference < 5 {
            title = "You almost had it!"
        } else if sliderTargetDifference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func startNewGame() {
        score = 0
        round = 1
        resetSliderAndTarget()
    }
    
    func startNewRound() {
        score = self.score + self.pointsForCurrentRound()
        round = self.round + 1
        resetSliderAndTarget()
    }
    
    func resetSliderAndTarget() {
        sliderValue = Double.random(in: 1...100)
        target = Int.random(in: 1...100)
    }
    
}


// View modifiers
// ==============

struct LabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
            .foregroundColor(Color.white)
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
    }
}

struct ValueStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
            .foregroundColor(Color.yellow)
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
    }
}

// Preview
// =======


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
