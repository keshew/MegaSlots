import SwiftUI

struct AchivModel: Codable, Identifiable {
    var id = UUID().uuidString
    var title: String
    var desc: String
    var image: String
    var reward: Int
    var isDone = false
    var currentProgress = 0
    var goalProgress = 10
}

struct AchievmentsView: View {
    @StateObject var achievmentsModel =  AchievmentsViewModel()
    @State var achiv = [AchivModel(title: "First Spin", desc: "Play your first slot game", image: "achiv1", reward: 50, isDone: true),
                        AchivModel(title: "Slot Explorer", desc: "Try all 4 slot machines", image: "achiv2", reward: 200),
                        AchivModel(title: "High Roller", desc: "Win 10,000 coins in total", image: "achiv3", reward: 500),
                        AchivModel(title: "Lucky Streak", desc: "Win 1,000 coins in a single spin", image: "achiv4", reward: 1000),
                        AchivModel(title: "Dedicated Player", desc: "Play 100 games", image: "achiv5", reward: 300),
                        AchivModel(title: "Spin Master", desc: "Make 500 spins", image: "achiv6", reward: 750)]
    
    var unlockedAchiv: [AchivModel] {
         achiv.filter { $0.isDone }
     }
     
     var inProgressAchiv: [AchivModel] {
         achiv.filter { !$0.isDone }
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
                                                Text("1020")
                                                    .FontSemiBold(size: 20, color: Color(red: 253/255, green: 199/255, blue: 2/255))
                                                
                                                Text("coins")
                                                    .FontRegular(size: 16, color: Color(red: 255/255, green: 240/255, blue: 133/255))
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                    
                                    HStack {
                                        Image(.cube)
                                            .resizable()
                                            .frame(width: 28, height: 32)
                                        
                                        Text("Achievements")
                                            .FontBold(size: 30)
                                    }
                                    
                                    Text("Unlock rewards and show off your progress!")
                                        .FontRegular(size: 16, color: .white.opacity(0.8))
                                }
                            }
                    }
                    .frame(height: 151)
                    .cornerRadius(14)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 15) {
                        Rectangle()
                            .fill(LinearGradient(colors: [Color(red: 241/255, green: 177/255, blue: 0/255),
                                                          Color(red: 254/255, green: 105/255, blue: 0/255)], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.2))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 253/255, green: 199/255, blue: 2/255), lineWidth: 2)
                                    .overlay {
                                        VStack {
                                            HStack(spacing: 15) {
                                                VStack {
                                                    Text("0")
                                                        .FontBold(size: 24, color: Color(red: 253/255, green: 199/255, blue: 2/255))
                                                    
                                                    Text("Unlocked")
                                                        .FontRegular(size: 14, color: .white.opacity(0.6))
                                                }
                                                
                                                VStack {
                                                    Text("1")
                                                        .FontBold(size: 24)
                                                    
                                                    Text("Total")
                                                        .FontRegular(size: 14, color: .white.opacity(0.6))
                                                }
                                                
                                                VStack {
                                                    Text("50")
                                                        .FontBold(size: 24, color: Color(red: 4/255, green: 223/255, blue: 114/255))
                                                    
                                                    Text("Coins Earned")
                                                        .FontRegular(size: 14, color: .white.opacity(0.6))
                                                }
                                            }
                                            
                                            VStack(spacing: 10) {
                                                ZStack(alignment: .leading) {
                                                    Rectangle()
                                                        .fill(.white.opacity(0.2))
                                                        .frame(height: 12)
                                                        .cornerRadius(10)
                                                    
                                                    Rectangle()
                                                        .fill(LinearGradient(colors: [Color(red: 253/255, green: 199/255, blue: 2/255),
                                                                                      Color(red: 255/255, green: 137/255, blue: 6/255)], startPoint: .leading, endPoint: .trailing))
                                                        .frame(width: 100, height: 12)
                                                        .cornerRadius(10)
                                                }
                                                .padding(.horizontal, 30)
                                                .padding(.top, 5)
                                                
                                                Text("17% Complete")
                                                    .FontRegular(size: 14, color: .white.opacity(0.6))
                                            }
                                            .padding(.top, 10)
                                        }
                                        .padding(.vertical)
                                    }
                            }
                            .frame(height: 133)
                            .cornerRadius(14)
                            .padding(.horizontal, 30)
                        
                        //MARK: - UNLOCKED
                        if !unlockedAchiv.isEmpty {
                            VStack {
                                HStack {
                                    Image(.unlock)
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                    
                                    Text("Unlocked Achievements")
                                        .FontBold(size: 20)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 30)
                                
                                ForEach(unlockedAchiv, id: \.id) { item in
                                    Rectangle()
                                        .fill(LinearGradient(colors: [Color(red: 0/255, green: 201/255, blue: 80/255).opacity(0.2),
                                                                      Color(red: 0/255, green: 188/255, blue: 125/255).opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .frame(height: 92)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 14)
                                                .stroke(Color(red: 57/255, green: 227/255, blue: 128/255))
                                                .overlay {
                                                    HStack {
                                                        Image(item.image)
                                                            .resizable()
                                                            .frame(width: 37, height: 37)
                                                        
                                                        VStack(alignment: .leading) {
                                                            HStack {
                                                                Text(item.title)
                                                                    .FontBold(size: 16)
                                                                
                                                                Rectangle()
                                                                    .fill(Color(red: 0/255, green: 201/255, blue: 80/255))
                                                                    .overlay {
                                                                        HStack {
                                                                            Image(.cube2)
                                                                                .resizable()
                                                                                .frame(width: 12, height: 12)
                                                                            
                                                                            Text("Unlocked")
                                                                                .FontMedium(size: 12, color: Color(red: 185/255, green: 248/255, blue: 207/255))
                                                                        }
                                                                    }
                                                                    .frame(width: 92, height: 22)
                                                                    .cornerRadius(8)
                                                            }
                                                            
                                                            Text(item.desc)
                                                                .FontRegular(size: 14, color: .white.opacity(0.8))
                                                            
                                                            HStack {
                                                                Image(.reward)
                                                                    .resizable()
                                                                    .frame(width: 14, height: 14)
                                                                
                                                                Text("+\(item.reward) coins")
                                                                    .FontSemiBold(size: 14, color: Color(red: 253/255, green: 199/255, blue: 2/255))
                                                            }
                                                        }
                                                        .padding(.leading, 5)
                                                        
                                                        Spacer()
                                                    }
                                                    .padding(.horizontal)
                                                }
                                        }
                                        .cornerRadius(14)
                                        .padding(.horizontal, 30)
                                }
                            }
                        }
                        
                        //MARK: - LOCKED
                        if !inProgressAchiv.isEmpty {
                            VStack {
                                HStack {
                                    Image(.lock)
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                    
                                    Text("In Progress")
                                        .FontBold(size: 20)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 30)
                                
                                ForEach(inProgressAchiv, id: \.id) { item in
                                    Rectangle()
                                        .fill(.white.opacity(0.2))
                                        .frame(height: 126)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 14)
                                                .stroke(.gray)
                                                .overlay {
                                                    HStack {
                                                        Image(item.image)
                                                            .resizable()
                                                            .frame(width: 37, height: 37)
                                                        
                                                        VStack(alignment: .leading, spacing: 7) {
                                                            HStack {
                                                                Text(item.title)
                                                                    .FontBold(size: 16)
                                                                
                                                                Rectangle()
                                                                    .fill(.white.opacity(0.2))
                                                                    .overlay {
                                                                        RoundedRectangle(cornerRadius: 8)
                                                                            .stroke(Color.gray)
                                                                            .overlay {
                                                                                HStack {
                                                                                    Image(.lock2)
                                                                                        .resizable()
                                                                                        .frame(width: 12, height: 12)
                                                                                    
                                                                                    Text("Locked")
                                                                                        .FontMedium(size: 12, color: .white.opacity(0.6))
                                                                                }
                                                                            }
                                                                    }
                                                                    .frame(width: 79, height: 22)
                                                                    .cornerRadius(8)
                                                            }
                                                            
                                                            Text(item.desc)
                                                                .FontRegular(size: 14, color: .white.opacity(0.8))
                                                            
                                                            VStack(spacing: 7) {
                                                                HStack {
                                                                    Text("Progress: 0/4")
                                                                        .FontRegular(size: 12, color: .white.opacity(0.6))
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Text("0%")
                                                                        .FontRegular(size: 12, color: .white.opacity(0.6))
                                                                }
                                                                
                                                                ZStack(alignment: .leading) {
                                                                    Rectangle()
                                                                        .fill(.white.opacity(0.2))
                                                                        .frame(height: 8)
                                                                        .cornerRadius(10)
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 81/255, green: 162/255, blue: 255/255),
                                                                                                      Color(red: 194/255, green: 122/255, blue: 255/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .frame(width: 100, height: 8)
                                                                        .cornerRadius(10)
                                                                }
                                                            }
                                                            HStack {
                                                                Image(.reward)
                                                                    .resizable()
                                                                    .frame(width: 14, height: 14)
                                                                
                                                                Text("Reward: \(item.reward) coins")
                                                                    .FontSemiBold(size: 14, color: Color(red: 253/255, green: 199/255, blue: 2/255))
                                                            }
                                                        }
                                                        .padding(.leading, 5)
                                                        
                                                        Spacer()
                                                    }
                                                    .padding(.horizontal)
                                                }
                                        }
                                        .cornerRadius(14)
                                        .padding(.horizontal, 30)
                                }
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
    AchievmentsView()
}

