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
    @State var sliderValue: Double = 50.0
    
    
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("100")
            }
            
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            
            
            // Button row
            Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
            .alert(isPresented: self.$alertIsVisible) {
                Alert(title: Text("Hello there!"), message: Text("TThe slider's value is \(Int(self.sliderValue.rounded()))."), dismissButton: .default(Text("Awesome!")))
            }
            
            Spacer()
            
            // Score row
            // TODO: Add views for the score, rounds, and start and info buttons here.
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
        
    }
    
    // Methods
    // =======
}

// Preview
// =======


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
