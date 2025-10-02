import SwiftUI

@main
struct MegaSlotsApp: App {
    
    init() {
        let defaults = UserDefaults.standard
        let hasLaunchedKey = "hasLaunchedBefore"
        let firstLaunchDateKey = "firstLaunchDate"
        
        if !defaults.bool(forKey: hasLaunchedKey) {
            UserDefaultsManager.shared.setCoins(1000)
            UserDefaultsManager.shared.addWinnings(0)
            defaults.set(true, forKey: hasLaunchedKey)
            defaults.set(Date(), forKey: firstLaunchDateKey) 
        }
    }

    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
