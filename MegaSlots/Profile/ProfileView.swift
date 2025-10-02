import SwiftUI

struct ProfileView: View {
    @StateObject var profileModel =  ProfileViewModel()
    @Environment(\.presentationMode) var presentationMode
    let level = max(1,  UserDefaultsManager.shared.getSpinsCount() / 10)
    let progressCount =  UserDefaultsManager.shared.getSpinsCount() % 10
    
    var string: String {
        let firstLaunchDateKey = "firstLaunchDate"
        let date = UserDefaults.standard.object(forKey: firstLaunchDateKey) as? Date ?? Date()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        let formattedDate = formatter.string(from: date)
        
        return "Member since \(formattedDate)"
    }
    
    var body: some View {
        ZStack {
            Image(.bgMain)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color(red: 0/255, green: 52/255, blue: 107/255))
                    .overlay {
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(red: 78/255, green: 80/255, blue: 166/255), lineWidth: 6)
                            .overlay {
                                VStack {
                                    HStack {
                                        Button(action: {
                                            NotificationCenter.default.post(name: Notification.Name("UserResourcesUpdated"), object: nil)
                                            presentationMode.wrappedValue.dismiss()
                                        }) {
                                            Image(.back)
                                                .resizable()
                                                .frame(width: 39, height: 39)
                                        }
                                        
                                        Spacer()
                                        
                                        HStack {
                                            Image(.coin)
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                            
                                            HStack(spacing: 5) {
                                                Text("\(profileModel.coins)")
                                                    .FontSemiBold(size: 20, color: Color(red: 253/255, green: 199/255, blue: 2/255))
                                                
                                                Text("coins")
                                                    .FontRegular(size: 16, color: Color(red: 255/255, green: 240/255, blue: 133/255))
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                    
                                    HStack {
                                        Image(.plyrProfile)
                                            .resizable()
                                            .frame(width: 28, height: 32)
                                        
                                        Text("Player Profile")
                                            .FontBold(size: 30)
                                    }
                                    
                                    Text("Your gaming journey and achievements")
                                        .FontRegular(size: 16, color: .white.opacity(0.8))
                                }
                            }
                    }
                    .frame(height: 151)
                    .cornerRadius(14)
                
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 15) {
                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(.gray, lineWidth: 2)
                                    .overlay {
                                        VStack {
                                            VStack(spacing: 25) {
                                                ZStack(alignment: .bottomTrailing) {
                                                    ZStack {
                                                        Circle()
                                                            .fill(Color(red: 208/255, green: 102/255, blue: 228/255))
                                                            .frame(width: 80, height: 80)
                                                        
                                                        Circle()
                                                            .fill(LinearGradient(colors: [Color(red: 174/255, green: 70/255, blue: 255/255),
                                                                                          Color(red: 246/255, green: 51/255, blue: 154/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                                            .frame(width: 70, height: 70)
                                                        
                                                        Text("🎰")
                                                            .font(.system(size: 30))
                                                    }
                                                    
//                                                    Button(action: {
//                                                        
//                                                    }) {
//                                                        Image(.pickImg)
//                                                            .resizable()
//                                                            .frame(width: 24, height: 24)
//                                                    }
                                                }
                                                
                                                Text("Player")
                                                    .FontBold(size: 24)
                                            }
                                            
                                            VStack(spacing: 10) {
                                                HStack {
                                                    Image(systemName: "star")
                                                        .foregroundStyle(Color(red: 252/255, green: 200/255, blue: 1/255))
                                                    
                                                    Text("Level \(level)")
                                                        .FontSemiBold(size: 16)
                                                }
                                                
                                                ZStack(alignment: .leading) {
                                                    Rectangle()
                                                        .fill(Color.white.opacity(0.2))
                                                        .frame(width: 300, height: 8)
                                                        .cornerRadius(10)
                                                    
                                                    Rectangle()
                                                        .fill(LinearGradient(colors: [
                                                            Color(red: 253/255, green: 199/255, blue: 2/255),
                                                            Color(red: 255/255, green: 137/255, blue: 6/255)
                                                        ], startPoint: .leading, endPoint: .trailing))
                                                        .frame(width: CGFloat(progressCount) * 30, height: 8) 
                                                        .cornerRadius(10)
                                                }
                                                .padding(.horizontal, 30)
                                                
                                                Text("\(progressCount)/10 games to next level")
                                                    .FontRegular(size: 12, color: .white.opacity(0.6))
                                            }
                                            .padding(.top, 10)
                                            
                                            Spacer()
                                            
                                            HStack {
                                                Image(systemName: "calendar")
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 20))
                                                
                                                Text(string)
                                                    .FontRegular(size: 14)
                                            }
                                        }
                                        .padding(.vertical)
                                    }
                            }
                            .frame(height: 314)
                            .cornerRadius(14)
                            .padding(.horizontal)
                        
                        VStack(spacing: 20) {
                            HStack(spacing: 20) {
                                Rectangle()
                                    .fill(.white.opacity(0.2))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(.gray, lineWidth: 2)
                                            .overlay {
                                                VStack {
                                                    Image(.profileItm1)
                                                        .resizable()
                                                        .frame(width: 38, height: 40)
                                                    
                                                    Text("\(UserDefaultsManager.shared.getTotalWinnings())")
                                                        .FontBold(size: 24, color: Color(red: 4/255, green: 223/255, blue: 114/255))
                                                    
                                                    Text("Total Winnings")
                                                        .FontRegular(size: 14)
                                                }
                                            }
                                    }
                                    .frame(height: 110)
                                    .cornerRadius(14)
                                    .padding(.leading)
                                
                                Rectangle()
                                    .fill(.white.opacity(0.2))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(.gray, lineWidth: 2)
                                            .overlay {
                                                VStack {
                                                    Image(.profileItm2)
                                                        .resizable()
                                                        .frame(width: 38, height: 40)
                                                    
                                                    Text("\(UserDefaultsManager.shared.getSpinsCount())")
                                                        .FontBold(size: 24, color: Color(red: 81/255, green: 162/255, blue: 255/255))
                                                    
                                                    Text("Games Played")
                                                        .FontRegular(size: 14)
                                                }
                                            }
                                    }
                                    .frame(height: 110)
                                    .cornerRadius(14)
                                    .padding(.trailing)
                            }
                            
                            HStack(spacing: 20) {
                                Rectangle()
                                    .fill(.white.opacity(0.2))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(.gray, lineWidth: 2)
                                            .overlay {
                                                VStack {
                                                    Image(.profileItm3)
                                                        .resizable()
                                                        .frame(width: 38, height: 40)
                                                    
                                                    Text("\(UserDefaultsManager.shared.getTotalWinnings() / 3)")
                                                        .FontBold(size: 24, color: Color(red: 194/255, green: 122/255, blue: 255/255))
                                                    
                                                    Text("Biggest Win")
                                                        .FontRegular(size: 14)
                                                }
                                            }
                                    }
                                    .frame(height: 110)
                                    .cornerRadius(14)
                                    .padding(.leading)
                                
                                Rectangle()
                                    .fill(.white.opacity(0.2))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(.gray, lineWidth: 2)
                                            .overlay {
                                                VStack {
                                                    Image(.profileItm4)
                                                        .resizable()
                                                        .frame(width: 38, height: 40)
                                                    
                                                    Text("\(UserDefaultsManager.shared.getSpinsCount())")
                                                        .FontBold(size: 24, color: Color(red: 255/255, green: 137/255, blue: 6/255))
                                                    
                                                    Text("Total Spins")
                                                        .FontRegular(size: 14)
                                                }
                                            }
                                    }
                                    .frame(height: 110)
                                    .cornerRadius(14)
                                    .padding(.trailing)
                            }
                        }
                    }
                    .padding(.top)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}

