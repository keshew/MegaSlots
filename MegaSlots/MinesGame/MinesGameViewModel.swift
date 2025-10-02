import SwiftUI

enum CellType {
    case diamond
    case bomb
}

struct CellState: Identifiable {
    var id = UUID().uuidString
    var type: CellType
    var isOpened: Bool = false
}

class MinesGameViewModel: ObservableObject {
    let contact = MinesGameModel()
    @Published var cells: [CellState] = Array(repeating: CellState(type: .diamond), count: 25)
      @Published var balance: Int = UserDefaultsManager.shared.getCoins()
      @Published var bet: Int = 15
      @Published var multiplierTextColor: Color = Color(red: 0/255, green: 167/255, blue: 196/255)
  
}
