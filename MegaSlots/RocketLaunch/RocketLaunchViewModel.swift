import SwiftUI

class RocketLaunchViewModel: ObservableObject {
    let contact = RocketLaunchModel()
    @Published var balance =  UserDefaultsManager.shared.getCoins()
    @Published var bet = 25
    @Published var multiplierTextColor: Color = Color(red: 141/255, green: 1/255, blue: 198/255)
}
