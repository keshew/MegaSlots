import SwiftUI

class SettingsViewModel: ObservableObject {
    let contact = SettingsModel()
    @Published var coins = UserDefaultsManager.shared.getCoins()
}
