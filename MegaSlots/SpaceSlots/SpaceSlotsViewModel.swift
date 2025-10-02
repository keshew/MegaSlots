import SwiftUI

class SpaceSlotsViewModel: ObservableObject {
    let contact = SpaceSlotsModel()
    @Published var slots: [[String]] = []
    @Published var balance = 1000
    @Published var bet = 15
    let allFruits = ["spaceSlot1", "spaceSlot2","spaceSlot3", "spaceSlot4","spaceSlot5", "spaceSlot6"]
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
            "spaceSlot1": 500,
            "spaceSlot2": 100,
            "spaceSlot3": 75,
            "spaceSlot4": 50,
            "spaceSlot5": 30,
            "spaceSlot6": 20
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
