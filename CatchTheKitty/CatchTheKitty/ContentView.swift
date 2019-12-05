//
//  ContentView.swift
//  CatchTheKitty
//
//  Created by Jake Caccamo on 12/4/19.
//  Copyright © 2019 Jake Caccamo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var score = 0
    @State var timeLeft = 10.0
    @State var chosenX = 0.5
    @State var chosenY = 200
    @State var showAlert = false
    
    let (x1, y1) = (0.15, 100)
    let (x2, y2) = (0.5, 100)
    let (x3, y3) = (0.85, 100)
    
    let (x4, y4) = (0.15, 200)
    let (x5, y5) = (0.5, 200)
    let (x6, y6) = (0.85, 200)
    
    let (x7, y7) = (0.15, 300)
    let (x8, y8) = (0.5, 300)
    let (x9, y9) = (0.85, 300)
    
    var gameTimer : Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeLeft < 0.5 {
                self.showAlert = true
            } else {
                self.timeLeft -= 1
            }
        }
    }
    
    var timer : Timer {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in

            let tupleArray = [(self.x1, self.y1), (self.x2, self.y2), (self.x3, self.y3), (self.x4, self.y4), (self.x5, self.y5), (self.x6, self.y6), (self.x7, self.y7), (self.x8, self.y8), (self.x9, self.y9)]

            var previousNumber : Int?

            func randomNumberGenerator() -> Int {
                var randomNumber =  Int(arc4random_uniform(UInt32(tupleArray.count - 1)))

                while randomNumber == previousNumber {
                    randomNumber =  Int(arc4random_uniform(UInt32(tupleArray.count - 1)))
                }

                previousNumber = randomNumber

                return randomNumber
            }

            self.chosenX = tupleArray[randomNumberGenerator()].0
            self.chosenY = tupleArray[randomNumberGenerator()].1
        }
    }
    
    var body: some View {
        VStack {
            Spacer().frame(height: 150)
            Text("Catch the Kitty").font(.largeTitle)
            Text("Score: \(self.score)").font(.title)
            Text("Time Left: \(self.timeLeft)").font(.title)

            Spacer().frame(height: 100)
            Image("kitty")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .gesture(TapGesture (count: 1).onEnded({ (_) in
                    self.score += 1
                }))
                .frame(width: 100, height: 100)
                .position(x: UIScreen.main.bounds.width * CGFloat(self.chosenX), y: CGFloat(self.chosenY))
                .onAppear {
                    _ = self.timer
                    _ = self.gameTimer
                }
            Spacer()
        }.alert(isPresented: $showAlert) {
            return Alert(title: Text("Game Over"), message: Text("Play Again?"), primaryButton: Alert.Button.default(Text("OK"), action: {
                self.score = 0;
                self.timeLeft = 10.0
            }), secondaryButton: Alert.Button.cancel())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
