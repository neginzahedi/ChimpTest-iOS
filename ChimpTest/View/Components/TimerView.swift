import SwiftUI

struct TimerView: View {
    @State private var timerIsActive = false
    @State private var timeElapsed = 0.0 // Time in seconds
    let timer = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect() // Update every millisecond

    var body: some View {
        VStack {
            Text(timeString(timeElapsed))
                .font(.largeTitle)
                .padding()

            HStack {
                Button("Start") {
                    startTimer()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Stop") {
                    stopTimer()
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Reset") {
                    resetTimer()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .onReceive(timer) { _ in
            if timerIsActive {
                timeElapsed += 0.001
            }
        }
    }

    private func startTimer() {
        timerIsActive = true
    }

    private func stopTimer() {
        timerIsActive = false
    }

    private func resetTimer() {
        timerIsActive = false
        timeElapsed = 0
    }
    
    private func timeString(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let milliseconds = Int((time - floor(time)) * 100)
        
        return String(format: "%02d:%02d:%02d", minutes, seconds, milliseconds)
    }
}

struct MillisecondTimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
