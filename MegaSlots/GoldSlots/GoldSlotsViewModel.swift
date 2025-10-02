import SwiftUI

class GoldSlotsViewModel: ObservableObject {
    let contact = GoldSlotsModel()
    @Published var slots: [[String]] = []
    @Published var balance =  UserDefaultsManager.shared.getCoins()
    @Published var bet = 15
    let allFruits = ["goldSlots1", "goldSlots2","goldSlots3", "goldSlots4","goldSlots5", "goldSlots6"]
    @Published var winningPositions: [(row: Int, col: Int)] = []
    @Published var isSpinning = false
    @Published var isStopSpininng = false
    @Published var isWin = false
    @Published var win = 0
    var spinningTimer: Timer?
    
    init() {
        resetSlots()
    }

    func resetSlots() {
        slots = (0..<3).map { _ in
            (0..<4).map { _ in
                allFruits.randomElement()!
            }
        }
    }
    
    func spin() {
        isSpinning = true
        spinningTimer?.invalidate()

        spinningTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.slots = (0..<3).map { _ in
                (0..<4).map { _ in self.allFruits.randomElement()! }
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.spinningTimer?.invalidate()
            self.checkWin()
            self.isSpinning = false
        }
    }

    func checkWin() {
        winningPositions = []
        var totalWin = 0
        let minCounts = [
            "goldSlots1": 4,
            "goldSlots2": 4,
            "goldSlots3": 4,
            "goldSlots4": 4,
            "goldSlots5": 3,
            "goldSlots6": 3
        ]
        let multipliers = [
            "goldSlots1": 1000,
            "goldSlots2": 800,
            "goldSlots3": 600,
            "goldSlots4": 500,
            "goldSlots5": 150,
            "goldSlots6": 120
        ]

        for row in 0..<3 {
            let rowContent = slots[row]
            var currentSymbol = rowContent[0]
            var count = 1
            for col in 1..<rowContent.count {
                if rowContent[col] == currentSymbol {
                    count += 1
                } else {
                    if let minCount = minCounts[currentSymbol], count >= minCount {
                        totalWin += multipliers[currentSymbol] ?? 0
                        let startCol = col - count
                        for c in startCol..<col {
                            winningPositions.append((row: row, col: c))
                        }
                    }
                    currentSymbol = rowContent[col]
                    count = 1
                }
            }
            if let minCount = minCounts[currentSymbol], count >= minCount {
                totalWin += multipliers[currentSymbol] ?? 0
                let startCol = rowContent.count - count
                for c in startCol..<rowContent.count {
                    winningPositions.append((row: row, col: c))
                }
            }
        }

        if totalWin != 0 {
            balance += (totalWin + bet)
            win = (totalWin + bet)
            isWin = true
            UserDefaultsManager.shared.addCoins(win)
            UserDefaultsManager.shared.addWinnings(win)
        }
    }
}
