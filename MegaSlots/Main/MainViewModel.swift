import SwiftUI

class MainViewModel: ObservableObject {
    let contact = MainModel()
    @Published var coin = UserDefaultsManager.shared.getCoins()
    @Published var total = UserDefaultsManager.shared.getTotalWinnings()
    @Published var achiv = false
    @Published var settings = false
    @Published var profile = false
    @Published var game1 = false
    @Published var game2 = false
    @Published var game3 = false
    @Published var game4 = false
    @Published var game5 = false
    @Published var game6 = false
    
    init() {
        NotificationCenter.default.addObserver(forName: Notification.Name("UserResourcesUpdated"), object: nil, queue: .main) { _ in
            self.coin = UserDefaultsManager.shared.getCoins()
            self.total = UserDefaultsManager.shared.getTotalWinnings()
        }
        
        self.coin = UserDefaultsManager.shared.getCoins()
        total = UserDefaultsManager.shared.getTotalWinnings()
    }
}
