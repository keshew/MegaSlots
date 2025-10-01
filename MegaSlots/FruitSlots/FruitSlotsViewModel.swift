import SwiftUI

class FruitSlotsViewModel: ObservableObject {
    let contact = FruitSlotsModel()
    @Published var slots: [[String]] = []
    @Published var balance = 1000
    @Published var bet = 50
    let allFruits = ["fruitSlot1", "fruitSlot2","fruitSlot3", "fruitSlot4","fruitSlot5", "fruitSlot6"]
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
            (0..<3).map { _ in
                allFruits.randomElement()!
            }
        }
    }
    
    func spin() {
        isSpinning = true
        spinningTimer?.invalidate()

        spinningTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.slots = (0..<3).map { _ in
                (0..<3).map { _ in self.allFruits.randomElement()! }
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
        let multipliers = [
            "fruitSlot1": 150,
            "fruitSlot2": 120,
            "fruitSlot3": 100,
            "fruitSlot4": 80,
            "fruitSlot5": 75,
            "fruitSlot6": 60
        ]

        for row in 0..<3 {
            let first = slots[row][0]
            if slots[row].allSatisfy({ $0 == first }) {
                if let multiplier = multipliers[first] {
                    totalWin += multiplier
                    for col in 0..<3 {
                        winningPositions.append((row: row, col: col))
                    }
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
