import SwiftUI
struct ContentView: View {
    // Game state
    @State private var currentStep = "start"
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            switch currentStep {
            case "start":
                Text("🏞️ You're at a golf course playing a par 3. What club do you use?")
                    .multilineTextAlignment(.center)
                HStack {
                    gameButton("Pitching Wedge") {
                        currentStep = "Wedge"
                    }
                    gameButton("Driver") {
                        currentStep = "Drive"
                    }
                }
            case "Wedge":
                Text("You made it on the green! What club will you use next?")
                    .multilineTextAlignment(.center)
                HStack {
                    gameButton("Pitching Wedge") {
                        currentStep = "Chip"
                    }
                    gameButton("Putter") {
                        currentStep = "Putt"
                        
                    }
                }
            case "Drive":
                Text("You are removed from the course!")
                Circle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                gameButton("Run Away") {
                    currentStep = "start"
                }
            case "Putt":
                Text("You must decide. Try to make the 100Ft putt or, play it safe.")
                Ellipse()
                    .fill(Color.green)
                    .frame(width: 120, height: 60)
                HStack {
                    gameButton("Try to make it") {
                        currentStep = "Try"
                    }
                    gameButton("Play it safe") {
                        currentStep = "Safe"
                    }
                }
            case "Chip":
                Text("You damaged the course! Pay 1000 Dollars!")
                Circle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                gameButton("Restart Game") {
                    currentStep = "start"
                }
            case "Try":
                Text("You missed.")
                
                gameButton("Try again") {
                    currentStep = "Putt"
                }
                
            case "Safe":
                Text("You got close to the hole. Do you line your putt up?")
                    .multilineTextAlignment(.center)
                HStack {
                    gameButton("Line up Putt") {
                        currentStep = "Line"
                    }
                    gameButton("Yolo") {
                        currentStep = "Yolo"
                    }
                }
                
                
            case "Yolo":
                Text("You missed, you got a bogey.")
                
                gameButton("Restart Game") {
                    currentStep = "start"
                }
            
        
        case "Line":
            Text("You made it, you got a Par!")
            
            gameButton("Restart Game") {
                currentStep = "start"
            }
        
        
        
            
                default:
                    Text("Game Over.")
                }
                Spacer()
            }
            .padding()
            .font(.title3)
        }
        // Reusable styled button
        func gameButton(_ label: String, action: @escaping () -> Void) -> some View {
            Button(action: action) {
                Text(label)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
#Preview {
    ContentView()
}
