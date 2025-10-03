import SwiftUI

struct MainView: View {
    @StateObject var mainModel =  MainViewModel()
    @ObservedObject private var soundManager = SoundManager.shared
    
    var body: some View {
        ZStack {
            Image(.bgMain)
                .resizable()
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing:  UIScreen.main.bounds.width > 700 ? 25 : 15) {
                    Image(.item1)
                        .resizable()
                        .overlay {
                            Color.clear.frame(height: 140).opacity(0.6)
                                        .overlay {
                                            ZStack {
                                                Image(.holder1)
                                                    .resizable()
                                                    .frame(height: UIScreen.main.bounds.width > 800 ? 220 : UIScreen.main.bounds.width > 700 ? 140 : 115)
                                                
                                                HStack {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        Text("Name game")
                                                            .FontBold(size: 30)
                                                        
                                                        HStack {
                                                            Image(.coin)
                                                                .resizable()
                                                                .frame(width: 40, height: 40)
                                                            
                                                            HStack(spacing: 5) {
                                                                Text("\(mainModel.coin)")
                                                                    .FontSemiBold(size: 20, color: Color(red: 253/255, green: 199/255, blue: 2/255))
                                                                
                                                                Text("coins")
                                                                    .FontRegular(size: 16, color: Color(red: 255/255, green: 240/255, blue: 133/255))
                                                            }
                                                        }
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    HStack {
                                                        Button(action: {
                                                            print("1")
                                                            mainModel.achiv = true
                                                        }) {
                                                            Image(.achiev)
                                                                .resizable()
                                                                .frame(width: 36, height: 36)
                                                        }
                                                        
                                                        Button(action: {
                                                            print("1")
                                                            mainModel.profile = true
                                                        }) {
                                                            Image(.profile)
                                                                .resizable()
                                                                .frame(width: 36, height: 36)
                                                        }
                                                        
                                                        Button(action: {
                                                            print("1")
                                                            mainModel.settings = true
                                                        }) {
                                                            Image(.settings)
                                                                .resizable()
                                                                .frame(width: 36, height: 36)
                                                        }
                                                    }
                                                }
                                                .padding(.horizontal, UIScreen.main.bounds.width > 700 ? 60 : 30)
                                            }
                                        }
                                
                        }
                        .aspectRatio(contentMode: .fill)
                        .frame(height: UIScreen.main.bounds.width > 800 ? 220 : UIScreen.main.bounds.width > 700 ? 140 : 115)
                        .clipped()
                        .cornerRadius(UIScreen.main.bounds.width > 700 ? 24 : 14)
                        .padding(.horizontal, UIScreen.main.bounds.width > 700 ? 140 : 15)
                    
                    ZStack {
                        Image(.item2)
                            .resizable()
                            .overlay {
                                Color.clear.frame(height: 108).opacity(0.6)
                                    .overlay {
                                        ZStack {
                                            Image(.holder2)
                                                .resizable()
                                                .frame(height: UIScreen.main.bounds.width > 700 ? 160 : 108)
                                            
                                            HStack {
                                                ZStack {
                                                    Circle()
                                                        .fill(Color(red: 141/255, green: 90/255, blue: 194/255))
                                                        .frame(width: 64, height: 64)
                                                    
                                                    Circle()
                                                        .fill(Color(red: 136/255, green: 60/255, blue: 186/255))
                                                        .frame(width: 56, height: 56)
                                                    
                                                    Image(.item1Img)
                                                        .resizable()
                                                        .frame(width: 48, height: 48)
                                                }
                                                
                                                VStack(alignment: .leading) {
                                                    Text("Player")
                                                        .FontSemiBold(size: 18)
                                                    
                                                    HStack {
                                                        HStack {
                                                            Image(.gamesImg)
                                                                .resizable()
                                                                .frame(width: 14, height: 14)
                                                            
                                                            Text("\(UserDefaultsManager.shared.getSpinsCount()) games")
                                                                .FontRegular(size: 14)
                                                        }
                                                    }
                                                }
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    mainModel.profile = true
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 174/255, green: 70/255, blue: 255/255).opacity(0.1))
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 8)
                                                                .stroke(Color(red: 194/255, green: 122/255, blue: 255/255), lineWidth: 2)
                                                                .overlay {
                                                                    Text("View Profile")
                                                                        .FontMedium(size: 14, color: Color(red: 232/255, green: 212/255, blue: 255/255))
                                                                }
                                                        }
                                                        .frame(width: 106, height: 32)
                                                        .cornerRadius(8)
                                                }
                                            }
                                            .padding(.horizontal, UIScreen.main.bounds.width > 700 ? 40 : 20)
                                        }
                                    }
                            }
                            .aspectRatio(contentMode: .fill)
                            .frame(height: UIScreen.main.bounds.width > 700 ? 160 : 108)
                            .clipped()
                            .cornerRadius(UIScreen.main.bounds.width > 700 ? 24 : 14)
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(height: UIScreen.main.bounds.width > 700 ? 160 : 108)
                    .padding(.horizontal, UIScreen.main.bounds.width > 700 ? 140 : 15)
                    
                    Button(action: {
                        mainModel.game1 = true
                    }) {
                        Image("item3r")
                            .resizable()
                            .frame(height: UIScreen.main.bounds.width > 800 ? 220 : UIScreen.main.bounds.width > 700 ? 140 : 115)
                            .padding(.horizontal, UIScreen.main.bounds.width > 700 ? 140 : 15)
                    }
                    
                    Button(action: {
                        mainModel.game2 = true
                    }) {
                        Image("item4r")
                            .resizable()
                            .frame(height: UIScreen.main.bounds.width > 800 ? 220 : UIScreen.main.bounds.width > 700 ? 140 : 115)
                            .padding(.horizontal, UIScreen.main.bounds.width > 700 ? 140 : 15)
                    }
                    
                    Button(action: {
                        mainModel.game3 = true
                    }) {
                        Image("item5r")
                            .resizable()
                            .frame(height: UIScreen.main.bounds.width > 800 ? 220 : UIScreen.main.bounds.width > 700 ? 140 : 115)
                            .padding(.horizontal, UIScreen.main.bounds.width > 700 ? 140 : 15)
                    }
                    
                    Button(action: {
                        mainModel.game4 = true
                    }) {
                        Image("item6r")
                            .resizable()
                            .frame(height: UIScreen.main.bounds.width > 800 ? 220 : UIScreen.main.bounds.width > 700 ? 140 : 115)
                            .padding(.horizontal, UIScreen.main.bounds.width > 700 ? 140 : 15)
                    }
                    
                    Button(action: {
                        mainModel.game5 = true
                    }) {
                        Image("item7r")
                            .resizable()
                            .frame(height: UIScreen.main.bounds.width > 800 ? 220 : UIScreen.main.bounds.width > 700 ? 140 : 115)
                            .padding(.horizontal, UIScreen.main.bounds.width > 700 ? 140 : 15)
                    }
                    
                    Button(action: {
                        mainModel.game6 = true
                    }) {
                        Image("item8r")
                            .resizable()
                            .frame(height: UIScreen.main.bounds.width > 800 ? 220 : UIScreen.main.bounds.width > 700 ? 140 : 115)
                            .padding(.horizontal, UIScreen.main.bounds.width > 700 ? 140 : 15)
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $mainModel.achiv) {
            AchievmentsView()
        }
        .fullScreenCover(isPresented: $mainModel.profile) {
            ProfileView()
        }
        .fullScreenCover(isPresented: $mainModel.settings) {
            SettingsView()
        }
        .fullScreenCover(isPresented: $mainModel.game1) {
            FruitSlotsView()
        }
        .fullScreenCover(isPresented: $mainModel.game2) {
            SpaceSlotsView()
        }
        .fullScreenCover(isPresented: $mainModel.game3) {
            MegSlotsView()
        }
        .fullScreenCover(isPresented: $mainModel.game4) {
            GoldSlotsView()
        }
        .fullScreenCover(isPresented: $mainModel.game5) {
            RocketLaunchView()
        }
        .fullScreenCover(isPresented: $mainModel.game6) {
            MinesGameView()
        }
    }
}

#Preview {
    MainView()
}

