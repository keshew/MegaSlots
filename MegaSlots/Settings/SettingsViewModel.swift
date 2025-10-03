import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var coins = UserDefaultsManager.shared.getCoins()
    @Published var isOn: Bool {
        didSet {
            UserDefaults.standard.set(isOn, forKey: "isSoundOn")
            if isOn {
                SoundManager.shared.playBackgroundMusic()
            } else {
                SoundManager.shared.stopAllSounds()
            }
        }
    }
    
    init() {
        self.isOn = UserDefaults.standard.bool(forKey: "isSoundOn")
        if isOn {
            SoundManager.shared.playBackgroundMusic()
        }
    }
}

extension SoundManager {
    func stopAllSounds() {
        bgPlayer?.stop()
        wheelPlayer?.stop()
        tapPlayer?.stop()
        slot1?.stop()
        slot2?.stop()
        slot3?.stop()
        slot4?.stop()
    }
}
