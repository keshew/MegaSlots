import SwiftUI

struct RocketLaunchView: View {
    @StateObject var fruitSlotsModel =  RocketLaunchViewModel()
    @State var showAlert = false
    @State private var progress: CGFloat = 0.0
    @State private var displayedMultiplier: CGFloat = 1.0
    @State private var isPlaying: Bool = false
    @State private var timer: Timer? = nil
    let gird = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var multiplierHistory: [CGFloat] = UserDefaults.standard.array(forKey: "multiplierHistory") as? [CGFloat] ?? []

    var body: some View {
        ZStack {
            ZStack {
                Image("rocketLaunchBG")
                    .resizable()
                
                LinearGradient(colors: [Color(red: 89/255, green: 22/255, blue: 139/255),
                                        Color(red: 134/255, green: 17/255, blue: 67/255),
                                        Color(red: 134/255, green: 17/255, blue: 67/255)], startPoint: .top, endPoint: .bottom)
                .opacity(0.5)
            }
            .ignoresSafeArea()
            .aspectRatio(contentMode: .fill)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    Image(.holder2)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: 110)
                        .overlay {
                            VStack {
                                HStack {
                                    Button(action: {
                                        
                                    }) {
                                        Image(.back)
                                            .resizable()
                                            .frame(width: 35, height: 35)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack {
                                        Image(.coin)
                                            .resizable()
                                            .frame(width: 35, height: 35)
                                        
                                        HStack(spacing: 5) {
                                            Text("\(fruitSlotsModel.balance)")
                                                .FontSemiBold(size: 20, color: Color(red: 253/255, green: 199/255, blue: 2/255))
                                            
                                            Text("coins")
                                                .FontRegular(size: 16, color: Color(red: 255/255, green: 240/255, blue: 133/255))
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                
                                HStack {
                                    Image(.rocket)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 33)
                                    
                                    Text("Rocket launch")
                                        .FontBold(size: 24)
                                    
                                    Image(.rocket)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 33)
                                }
                            }
                        }
                    
                    Image(.descRocket)
                        .resizable()
                        .overlay {
                            ZStack(alignment: .bottomLeading) {
                                Rectangle()
                                    .fill(Color(red: 38/255, green: 19/255, blue: 30/255).opacity(0.7))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(Color(red: 223/255, green: 4/255, blue: 190/255), lineWidth: 5)
                                            .overlay(
                                                VStack {
                                                    Image(.rocket)
                                                        .resizable()
                                                        .frame(width: 60, height: 70)
                                                        .padding(.top)
                                                    Text("X \(String(format: "%.2f", displayedMultiplier))")
                                                        .FontBold(size: 35, color: fruitSlotsModel.multiplierTextColor)
                                                        .outlineText(color: .white, width: 1)
                                                    Spacer()
                                                }
                                            )
                                    )
                                    .frame(width: 316, height: 228)
                                    .cornerRadius(14)
                                
                                GeometryReader { geo in
                                                ZStack(alignment: .bottomLeading) {
                                                    LinearGradient(
                                                        gradient: Gradient(colors: [.red, .yellow, .green]),
                                                        startPoint: .bottom,
                                                        endPoint: .top
                                                    )
                                                    .mask(
                                                        Path { path in
                                                            let width = geo.size.width
                                                            let height = geo.size.height
                                                            let diagProgress = progress

                                                            path.move(to: CGPoint(x: width * diagProgress, y: height * (1 - diagProgress)))
                                                            path.addLine(to: CGPoint(x: width * diagProgress, y: height))
                                                            path.addLine(to: CGPoint(x: 0, y: height))
                                                            path.closeSubpath()
                                                        }
                                                    )

                                                    Path { path in
                                                        let width = geo.size.width
                                                        let height = geo.size.height
                                                        let diagProgress = progress

                                                        path.move(to: CGPoint(x: 0, y: height))
                                                        path.addLine(to: CGPoint(x: width * diagProgress, y: height * (1 - diagProgress)))
                                                    }
                                                    .stroke(Color.white, lineWidth: 3)
                                                }
                                            }
                                
                                .frame(width: 306, height: 218)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.4)) {
                                        progress += 0.1
                                        if progress > 0.4 { progress = 0.1 }
                                    }
                                }
                                .offset(x: 8, y: -2)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: 269)
                    
                    Rectangle()
                        .fill(Color(red: 157/255, green: 16/255, blue: 159/255).opacity(0.4))
                        .overlay {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(red: 157/255, green: 16/255, blue: 159/255), lineWidth: 6)
                                .overlay {
                                    VStack(spacing: 13) {
                                        HStack(alignment: .bottom) {
                                            Button(action: {
                                                if fruitSlotsModel.bet >= 50 {
                                                    fruitSlotsModel.bet -= 50
                                                }
                                            }) {
                                                Rectangle()
                                                    .fill(Color(red: 177/255, green: 7/255, blue: 161/255).opacity(0.4))
                                                    .frame(width: 40, height: 40)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 8)
                                                            .stroke(Color(red: 177/255, green: 7/255, blue: 161/255), lineWidth: 3)
                                                            .overlay {
                                                                Text("-")
                                                                    .FontBold(size: 22)
                                                            }
                                                    }
                                                    .cornerRadius(8)
                                            }
                                            
                                            VStack(spacing: 5) {
                                                Text("Bet Amount:")
                                                    .FontSemiBold(size: 18, color: Color(red: 248/255, green: 184/255, blue: 236/255))
                                                
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 195/255, green: 0/255, blue: 207/255),
                                                                                  Color(red: 188/255, green: 1/255, blue: 179/255)], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: 114, height: 37)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 177/255, green: 7/255, blue: 161/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("\(fruitSlotsModel.bet) coins")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .cornerRadius(6)
                                            }
                                            
                                            Button(action: {
                                                if fruitSlotsModel.bet <= fruitSlotsModel.balance - 50 {
                                                    fruitSlotsModel.bet += 50
                                                }
                                            }) {
                                                Rectangle()
                                                    .fill(Color(red: 177/255, green: 7/255, blue: 161/255).opacity(0.4))
                                                    .frame(width: 40, height: 40)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 8)
                                                            .stroke(Color(red: 177/255, green: 7/255, blue: 161/255), lineWidth: 3)
                                                            .overlay {
                                                                Text("+")
                                                                    .FontBold(size: 22)
                                                            }
                                                    }
                                                    .cornerRadius(8)
                                            }
                                            
                                        }
                                        
                                        HStack {
                                            Button(action: {
                                                fruitSlotsModel.bet = fruitSlotsModel.balance / 2
                                            }) {
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 195/255, green: 0/255, blue: 207/255),
                                                                                  Color(red: 188/255, green: 1/255, blue: 179/255)], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: 75, height: 30)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 177/255, green: 7/255, blue: 161/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("1\\2")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .cornerRadius(6)
                                            }
                                            
                                            Button(action: {
                                                fruitSlotsModel.bet = fruitSlotsModel.balance / 4
                                            }) {
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 195/255, green: 0/255, blue: 207/255),
                                                                                  Color(red: 188/255, green: 1/255, blue: 179/255)], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: 75, height: 30)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 177/255, green: 7/255, blue: 161/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("1\\4")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .cornerRadius(6)
                                            }
                                            
                                            Button(action: {
                                                fruitSlotsModel.bet = fruitSlotsModel.balance / 8
                                            }) {
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 195/255, green: 0/255, blue: 207/255),
                                                                                  Color(red: 188/255, green: 1/255, blue: 179/255)], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: 75, height: 30)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 177/255, green: 7/255, blue: 161/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("1\\8")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .cornerRadius(6)
                                            }
                                            
                                            Button(action: {
                                                fruitSlotsModel.bet = fruitSlotsModel.balance / 16
                                            }) {
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 195/255, green: 0/255, blue: 207/255),
                                                                                  Color(red: 188/255, green: 1/255, blue: 179/255)], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: 75, height: 30)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 177/255, green: 7/255, blue: 161/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("1\\16")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .cornerRadius(6)
                                            }
                                        }
                                        
                                        Button(action: {
                                            if isPlaying {
                                                timer?.invalidate()
                                                timer = nil
                                                finalizeGame()
                                            } else {
                                                launchAction()
                                            }
                                        }) {
                                            Rectangle()
                                                .fill(LinearGradient(colors: [Color(red: 195/255, green: 0/255, blue: 207/255),
                                                                              Color(red: 188/255, green: 1/255, blue: 179/255)],
                                                                     startPoint: .leading,
                                                                     endPoint: .trailing))
                                                .frame(width: 95, height: 30)
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 6)
                                                        .stroke(Color(red: 177/255, green: 7/255, blue: 161/255), lineWidth: 3)
                                                        .overlay {
                                                            HStack {
                                                                Text(isPlaying ? "STOP" : "LAUNCH")
                                                                    .FontBold(size: 15)
                                                            }
                                                        }
                                                }
                                                .cornerRadius(6)
                                        }
                                        .disabled(fruitSlotsModel.bet > fruitSlotsModel.balance)
                                        .alert(isPresented: $showAlert) {
                                            Alert(
                                                title: Text("Not enough coins"),
                                                message: Text("You do not have enough coins to spin."),
                                                dismissButton: .default(Text("Ok"))
                                            )
                                        }
                                    }
                                }
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: 177)
                        .cornerRadius(14)
                    
                    Rectangle()
                        .fill(Color(red: 113/255, green: 10/255, blue: 178/255).opacity(0.4))
                        .overlay {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(red: 113/255, green: 10/255, blue: 178/255), lineWidth: 6)
                                .overlay {
                                    VStack {
                                        Text("History:")
                                            .FontSemiBold(size: 18, color: Color(red: 248/255, green: 185/255, blue: 238/255))
                                            .padding(.top, 10)
                                        
                                        ScrollView(showsIndicators: false) {
                                            if multiplierHistory.isEmpty {
                                                Text("There are no history yet")
                                                    .FontSemiBold(size: 18, color: Color(red: 248/255, green: 185/255, blue: 238/255))
                                                    .padding()
                                            } else {
                                                LazyVGrid(columns: gird) {
                                                    ForEach(multiplierHistory.indices, id: \.self) { index in
                                                        let multiplier = multiplierHistory[index]
                                                        Rectangle()
                                                            .fill(fillColor(for: index))
                                                            .frame(width: 75, height: 30)
                                                            .overlay {
                                                                RoundedRectangle(cornerRadius: 6)
                                                                    .stroke(Color(red: 177/255, green: 7/255, blue: 161/255), lineWidth: 3)
                                                                    .overlay {
                                                                        HStack {
                                                                            Text("X \(String(format: "%.2f", multiplier))")
                                                                                .FontBold(size: 15)
                                                                        }
                                                                    }
                                                            }
                                                            .cornerRadius(6)
                                                    }
                                                }
                                                .padding(.horizontal)
                                                .padding(.bottom, 10)
                                            }
                                        }
                                    }
                                }
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: 187)
                        .cornerRadius(14)
                        .padding(.top, 5)
                }
            }
        }
    }
    
    func launchAction() {
        guard !isPlaying else { return }
        guard fruitSlotsModel.bet <= fruitSlotsModel.balance else {
            showAlert = true
            return
        }

        isPlaying = true
        fruitSlotsModel.balance -= fruitSlotsModel.bet
        progress = 0.0
        displayedMultiplier = 1.0
        fruitSlotsModel.multiplierTextColor = Color(red: 141/255, green: 1/255, blue: 198/255)

        let won = Bool.random()
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { t in
            if progress < 0.4 {
                progress += 0.01
                displayedMultiplier = 1.0 + progress * 3
                if !won && progress > 0.05 && Bool.random() {
                    fruitSlotsModel.multiplierTextColor = .red
                    isPlaying = false
                    t.invalidate()
                    timer = nil
                }
            } else {
                t.invalidate()
                timer = nil
                finalizeGame()
            }
        }
    }

    func finalizeGame() {
        fruitSlotsModel.multiplierTextColor = .green
        let winAmount = Int(CGFloat(fruitSlotsModel.bet) * displayedMultiplier)
        fruitSlotsModel.balance += winAmount
        isPlaying = false
        
        multiplierHistory.append(displayedMultiplier)
        UserDefaults.standard.set(multiplierHistory, forKey: "multiplierHistory")
    }

    func getMultiplierHistory() -> [CGFloat] {
        return multiplierHistory
    }
    
    func fillColor(for index: Int) -> Color {
        switch index % 4 {
        case 0:
            return Color(red: 202/255, green: 0/255, blue: 171/255).opacity(0.5)
        case 1:
            return Color(red: 0/255, green: 201/255, blue: 34/255).opacity(0.5)
        case 2:
            return Color(red: 12/255, green: 12/255, blue: 201/255).opacity(0.5)
        default:
            return Color(red: 202/255, green: 0/255, blue: 171/255).opacity(0.5)
        }
    }
}

#Preview {
    RocketLaunchView()
}

