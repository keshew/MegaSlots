import SwiftUI

class ProfileViewModel: ObservableObject {
    let contact = ProfileModel()
    @Published var coins =  UserDefaultsManager.shared.getCoins()
}
