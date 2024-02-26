import SwiftUI


struct PrimaryButton: View {
    var action: () -> ()
    var text: String;

    init(text: String, action: @escaping () -> Void) {
        self.action = action
        self.text = text
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(self.text)
                .bold()
                .font(.system(.title2, design: .monospaced))
                .padding(.horizontal, 50)
                .padding(.vertical, 10)
        }
        .foregroundColor(.white)
        .background(.black)
        .cornerRadius(10)
    }
}

#Preview {
    PrimaryButton(text: "PrimaryButton") {
        print("Clicked!")
    }
}
