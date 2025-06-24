//
//  ContentView.swift
//  BallGame
//
//  Created by Syd on 6/23/25.
//

import SwiftUI
struct ContentView: View {
    // State variables to track position and score
    @State private var position = CGPoint(x: 150, y: 300)
    @State private var score = 0
    @State private var screenSize = CGSize.zero // For boundary awareness
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white.ignoresSafeArea()
                // Score display and restart button at the top
                VStack {
                    Text("Score: \(score)")
                        .font(.title)
                        .padding(.top, 40)
                    
                    Button(
                        action:{restartGame()}
                    ){
                        Text("Restart Game")
                            .padding(8)
                            .background(Color.green.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                    
                    Spacer()
                }
                // Moving circle
                Circle()
                    .fill(Color.blue)
                    .frame(width: 80, height: 80)
                    .position(position)
                    .onTapGesture {
                        // Increase score and move circle to new position
                        score += 1
                        moveCircle(in: geometry.size)
                    }
            }
            // Store the screen size for later use
            .onAppear {
                screenSize = geometry.size
            }
        }
    }
    // Function to move the circle to a random screen position
    func moveCircle(in size: CGSize) {
        let padding: CGFloat = 40 // Prevents the circle from going offscreen
        // Height to reserve at the top for score and button UI
        let topReservedHeight: CGFloat = 120
        let newX = CGFloat.random(in: padding...(size.width - padding))
        let newY = CGFloat.random(in: padding...(size.height - padding))
        withAnimation(.easeInOut(duration: 0.3)) {
            position = CGPoint(x: newX, y: newY)
        }
    }
    
    func restartGame(){
        score = 0
        position = CGPoint(x:screenSize.width/2, y:screenSize.height/2)
    }
    

}
#Preview {
    ContentView()
}
