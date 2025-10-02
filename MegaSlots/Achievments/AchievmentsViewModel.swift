import SwiftUI

class AchievmentsViewModel: ObservableObject {
    let contact = AchievmentsModel()
    @Published var coins = UserDefaultsManager.shared.getCoins()
    
    func rewardCoins(_ amount: Int) {
        UserDefaultsManager.shared.addCoins(amount)
        coins = UserDefaultsManager.shared.getCoins()
    }
}
