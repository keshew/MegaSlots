import SwiftUI

struct MinesGameView: View {
    @StateObject var fruitSlotsModel =  MinesGameViewModel()
    @State var showAlert = false
    @State private var isPlaying = false
    @State private var multiplier: CGFloat = 1.0
    @State private var bombCount = 3
    @State private var timer: Timer? = nil
    let grid5 = Array(repeating: GridItem(.flexible(), spacing: 0), count: 5)
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var soundManager = SoundManager.shared
    
    var body: some View {
        ZStack {
            ZStack {
                Image("minesBG")
                    .resizable()
                
                LinearGradient(colors: [Color(red: 0/255, green: 90/255, blue: 201/255),
                                        Color(red: 1/255, green: 132/255, blue: 187/255),
                                        Color(red: 0/255, green: 147/255, blue: 201/255)], startPoint: .top, endPoint: .bottom)
                .opacity(0.5)
            }
            .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    Image(.holder5)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: UIScreen.main.bounds.width > 700 ? 180 : 110)
                        .overlay {
                            VStack {
                                HStack {
                                    Button(action: {
                                        NotificationCenter.default.post(name: Notification.Name("UserResourcesUpdated"), object: nil)
                                        presentationMode.wrappedValue.dismiss()
                                    }) {
                                        Image(.minesBack)
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
                                .padding(.horizontal, UIScreen.main.bounds.width > 700 ? 40 : 20)
                                
                                HStack {
                                    Image(.dimond)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 31, height: 28)
                                    
                                    Text("Mines Game")
                                        .FontBold(size: 24)
                                    
                                    Image(.dimond)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 31, height: 28)
                                }
                            }
                        }
                    
                    ZStack(alignment: .top) {
                        Image(.minesDesc)
                            .resizable()
                            .overlay {
                                Rectangle()
                                    .fill(Color(red: 38/255, green: 19/255, blue: 30/255).opacity(0.7))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(Color(red: 4/255, green: 144/255, blue: 224/255), lineWidth: 5)
                                            .overlay {
                                                LazyVGrid(columns: grid5, spacing: 10) {
                                                    ForEach(fruitSlotsModel.cells) { cell in
                                                        Rectangle()
                                                            .fill(cellColor(for: cell))
                                                            .frame(width: 45, height: 45)
                                                            .overlay {
                                                                if cell.isOpened {
                                                                    Image(cell.type == .bomb ? "bomb" : "dimond")
                                                                        .resizable()
                                                                        .frame(width: cell.type == .bomb ? 27 : 31, height: cell.type == .bomb ? 38 : 28)
                                                                }
                                                                RoundedRectangle(cornerRadius: 8)
                                                                    .stroke(Color.white, lineWidth: 3)
                                                            }
                                                            .cornerRadius(8)
                                                            .onTapGesture {
                                                                if isPlaying && !cell.isOpened {
                                                                    openCell(cell)
                                                                    soundManager.playTapMusic()
                                                                }
                                                            }
                                                    }
                                                }
                                                .padding(10)
                                            }
                                    )
                                    .frame(width: 316, height: 318)
                                    .cornerRadius(14)
                            }
                            .frame(width: UIScreen.main.bounds.size.width - 30,  height: UIScreen.main.bounds.width > 700 ? 480 : 389)
                            .padding(.top, 15)
                        
                        Rectangle()
                            .fill(LinearGradient(colors: [Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                            .frame(width: 95, height: 40)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                    .overlay {
                                        HStack {
                                            Text("X \(String(format: "%.2f", multiplier))")
                                                .FontBold(size: 23, color: fruitSlotsModel.multiplierTextColor)
                                                .outlineText(color: .white, width: 0.5)
                                        }
                                    }
                            }
                            .cornerRadius(6)
                    }
                    
                    Rectangle()
                        .fill(Color(red: 4/255, green: 144/255, blue: 224/255).opacity(0.2))
                        .overlay {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(red: 4/255, green: 144/255, blue: 224/255), lineWidth: 6)
                                .overlay {
                                    VStack(spacing: 13) {
                                        HStack(alignment: .bottom) {
                                            Button(action: {
                                                if fruitSlotsModel.bet >= 50 {
                                                    fruitSlotsModel.bet -= 50
                                                }
                                            }) {
                                                Rectangle()
                                                    .fill(Color(red: 10/255, green: 126/255, blue: 190/255).opacity(0.4))
                                                    .frame(width: 40, height: 40)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 8)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                Text("-")
                                                                    .FontBold(size: 22)
                                                            }
                                                    }
                                                    .cornerRadius(8)
                                            }
                                            
                                            VStack(spacing: 5) {
                                                Text("Bet Amount:")
                                                    .FontSemiBold(size: 18, color: Color(red: 184/255, green: 241/255, blue: 248/255))
                                                
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 1/255, green: 138/255, blue: 207/255),
                                                                                  Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("\(fruitSlotsModel.bet) coins")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .frame(width: 114, height: 37)
                                                    .cornerRadius(6)
                                            }
                                            
                                            Button(action: {
                                                if fruitSlotsModel.bet <= fruitSlotsModel.balance - 50 {
                                                    fruitSlotsModel.bet += 50
                                                }
                                            }) {
                                                Rectangle()
                                                    .fill(Color(red: 10/255, green: 126/255, blue: 190/255).opacity(0.4))
                                                    .frame(width: 40, height: 40)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 8)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                Text("+")
                                                                    .FontBold(size: 22)
                                                            }
                                                    }
                                                    .cornerRadius(8)
                                            }
                                            
                                        }
                                        
                                        Text("Mines Amount:")
                                            .FontSemiBold(size: 18, color: Color(red: 184/255, green: 241/255, blue: 248/255))
                                        
                                        HStack {
                                            Button(action: {
                                                setBombsCount(3)
                                            }) {
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 1/255, green: 138/255, blue: 207/255),
                                                                                  Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: 75, height: 30)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("3")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .cornerRadius(6)
                                            }
                                            
                                            Button(action: {
                                                setBombsCount(4)
                                            }) {
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 1/255, green: 138/255, blue: 207/255),
                                                                                  Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: 75, height: 30)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("4")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .cornerRadius(6)
                                            }
                                            
                                            Button(action: {
                                                setBombsCount(5)
                                            }) {
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 1/255, green: 138/255, blue: 207/255),
                                                                                  Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: 75, height: 30)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("5")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .cornerRadius(6)
                                            }
                                            
                                            Button(action: {
                                                setBombsCount(6)
                                            }) {
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 1/255, green: 138/255, blue: 207/255),
                                                                                  Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: 75, height: 30)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("6")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .cornerRadius(6)
                                            }
                                        }
                                        
                                        Button(action: {
                                            if isPlaying {
                                                claimReward()
                                            } else {
                                                startGame()
                                                UserDefaultsManager.shared.incrementSpinsCount()
                                            }
                                        }) {
                                            Rectangle()
                                                .fill(LinearGradient(colors: [Color(red: 1/255, green: 138/255, blue: 207/255),
                                                                              Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                                                .frame(width: 95, height: 30)
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 6)
                                                        .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                        .overlay {
                                                            HStack {
                                                                Text(isPlaying ? "CLAIM" : "LAUNCH")
                                                                    .FontBold(size: 15)
                                                            }
                                                        }
                                                }
                                                .cornerRadius(6)
                                        }
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
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: 207)
                        .cornerRadius(14)
                }
            }
        }
        .onAppear {
            initializeCells()
        }
    }
    
    func initializeCells() {
        var initialCells = [CellState]()
        for _ in 0..<25 {
            initialCells.append(CellState(type: .diamond, isOpened: false))
        }
        fruitSlotsModel.cells = initialCells
    }

    func startGame() {
        isPlaying = true
        multiplier = 1.0
        fruitSlotsModel.multiplierTextColor = Color(red: 0/255, green: 167/255, blue: 196/255)
        fruitSlotsModel.balance -= fruitSlotsModel.bet
        UserDefaultsManager.shared.subtractCoins(fruitSlotsModel.bet)
        var newCells = (0..<25).map { _ in CellState(type: .diamond) }


        var bombsPlaced = 0
        while bombsPlaced < bombCount {
            let index = Int.random(in: 0..<25)
            if newCells[index].type != .bomb {
                newCells[index].type = .bomb
                bombsPlaced += 1
            }
        }

        DispatchQueue.main.async {
            self.fruitSlotsModel.cells = newCells
        }
    }

    
    func openCell(_ cell: CellState) {
        guard let idx = fruitSlotsModel.cells.firstIndex(where: { $0.id == cell.id }) else { return }
        fruitSlotsModel.cells[idx].isOpened = true

        if fruitSlotsModel.cells[idx].type == .bomb {
            fruitSlotsModel.multiplierTextColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                endGame(lost: true)
                initializeCells()
            }
        } else {
            multiplier += 0.2
            fruitSlotsModel.multiplierTextColor = Color(red: 0/255, green: 167/255, blue: 196/255)

            if fruitSlotsModel.cells.filter({ $0.type == .diamond && !$0.isOpened }).isEmpty {
                endGame(lost: false)
            }
        }
    }
    
    func claimReward() {
        let winAmount = Int(fruitSlotsModel.bet) * Int(multiplier * 100) / 100
        endGame(lost: false)
        initializeCells()
        UserDefaultsManager.shared.addCoins(winAmount)
        UserDefaultsManager.shared.addWinnings(winAmount)
    }
    
    func endGame(lost: Bool) {
        isPlaying = false
        if lost {
            
        } else {
            let winAmount = Int(fruitSlotsModel.bet) * Int(multiplier * 100) / 100
            fruitSlotsModel.balance += winAmount
        }
    }

    
    func setBombsCount(_ count: Int) {
        bombCount = count
    }
    
    func cellColor(for cell: CellState) -> Color {
        if !cell.isOpened {
            return Color.gray
        } else if cell.type == .bomb {
            return Color.red
        } else {
            return Color.green
        }
    }
}

#Preview {
    MinesGameView()
}

