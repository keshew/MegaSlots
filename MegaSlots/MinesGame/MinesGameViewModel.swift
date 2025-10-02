import SwiftUI

class MinesGameViewModel: ObservableObject {
    let contact = MinesGameModel()
    @Published var balance = 1000
    @Published var bet = 5
}
