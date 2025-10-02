import SwiftUI

class RocketLaunchViewModel: ObservableObject {
    let contact = RocketLaunchModel()
    @Published var balance = 1000
    @Published var bet = 15
    @Published var multiplierTextColor: Color = Color(red: 141/255, green: 1/255, blue: 198/255)
}
