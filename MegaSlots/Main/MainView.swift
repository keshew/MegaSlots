import SwiftUI

struct MainView: View {
    @StateObject var mainModel =  MainViewModel()
    
    var body: some View {
        ZStack {
            Image(.bgMain)
                .resizable()
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    Image(.item1)
                        .resizable()
                        .overlay {
                            Color.clear.frame(height: 140).opacity(0.6)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color(red: 253/255, green: 199/255, blue: 2/255).opacity(0.4), lineWidth: 6)
                                        .overlay {
                                            ZStack {
                                                Image(.holder1)
                                                    .resizable()
                                                    .frame(height: 140)
                                                
                                                HStack {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        Text("Name game")
                                                            .FontBold(size: 30)
                                                        
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
                                                    
                                                    Spacer()
                                                    
                                                    HStack {
                                                        Button(action: {
                                                            
                                                        }) {
                                                            Image(.achiev)
                                                                .resizable()
                                                                .frame(width: 36, height: 36)
                                                        }
                                                        
                                                        Button(action: {
                                                            
                                                        }) {
                                                            Image(.profile)
                                                                .resizable()
                                                                .frame(width: 36, height: 36)
                                                        }
                                                        
                                                        Button(action: {
                                                            
                                                        }) {
                                                            Image(.settings)
                                                                .resizable()
                                                                .frame(width: 36, height: 36)
                                                        }
                                                    }
                                                }
                                                .padding(.horizontal, 30)
                                            }
                                        }
                                }
                        }
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 140)
                        .clipped()
                        .cornerRadius(14)
                        .padding(.horizontal)
                    
                    ZStack {
                        Image(.item2)
                            .resizable()
                            .overlay {
                                Color.clear.frame(height: 108).opacity(0.6)
                                    .overlay {
                                        ZStack {
                                            Image(.holder2)
                                                .resizable()
                                                .frame(height: 108)
                                            
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
                                                            
                                                            Text("1 games")
                                                                .FontRegular(size: 14)
                                                        }
                                                        
                                                        HStack {
                                                            Image("wonImg")
                                                                .resizable()
                                                                .frame(width: 14, height: 14)
                                                            
                                                            Text("0 won")
                                                                .FontRegular(size: 14)
                                                        }
                                                    }
                                                }
                                                
                                                Spacer()
                                                
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
                                            .padding(.horizontal)
                                        }
                                    }
                            }
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 108)
                            .clipped()
                            .cornerRadius(14)
                        
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(red: 194/255, green: 122/255, blue: 255/255).opacity(0.4), lineWidth: 3)
                            .frame(height: 108)
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 108)
                    .padding(.horizontal)
                    
                    Image("item3r")
                        .resizable()
                        .frame(height: 115)
                        .padding(.horizontal)
                    
                    Image("item4r")
                        .resizable()
                        .frame(height: 115)
                        .padding(.horizontal)
                    
                    Image("item5r")
                        .resizable()
                        .frame(height: 115)
                        .padding(.horizontal)
                    
                    Image("item6r")
                        .resizable()
                        .frame(height: 115)
                        .padding(.horizontal)
                    
                    Image("item7r")
                        .resizable()
                        .frame(height: 115)
                        .padding(.horizontal)
                    
                    Image("item8r")
                        .resizable()
                        .frame(height: 115)
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    MainView()
}

