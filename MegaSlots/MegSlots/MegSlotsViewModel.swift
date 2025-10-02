import SwiftUI

class MegSlotsViewModel: ObservableObject {
    let contact = MegSlotsModel()
    @Published var slots: [[String]] = []
    @Published var balance = 1000
    @Published var bet = 25
    let allFruits = ["megaSlot1", "megaSlot2","megaSlot3", "megaSlot4","megaSlot5", "megaSlot6"]
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
            (0..<5).map { _ in
                allFruits.randomElement()!
            }
        }
    }
    
    func spin() {
        isSpinning = true
        spinningTimer?.invalidate()

        spinningTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.slots = (0..<3).map { _ in
                (0..<5).map { _ in self.allFruits.randomElement()! }
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
            "megaSlot1": 5,
            "megaSlot2": 5,
            "megaSlot3": 5,
            "megaSlot4": 5,
            "megaSlot5": 4,
            "megaSlot6": 3
        ]
        let multipliers = [
            "megaSlot1": 2000,
            "megaSlot2": 1500,
            "megaSlot3": 1200,
            "megaSlot4": 1000,
            "megaSlot5": 400,
            "megaSlot6": 100
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
        }
    }
}
