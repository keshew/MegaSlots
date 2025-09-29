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
                            Color(red: 84/255, green: 56/255, blue: 165/255).frame(height: 140).opacity(0.6)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color(red: 253/255, green: 199/255, blue: 2/255).opacity(0.4), lineWidth: 6)
                                        .overlay {
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
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 140)
                        .clipped()
                        .cornerRadius(14)
                        .padding(.horizontal)
                    
                    ZStack {
                        Image(.item2)
                            .resizable()
                            .overlay {
                                Color(red: 84/255, green: 56/255, blue: 165/255).frame(height: 140).opacity(0.6)
                                    .overlay {
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
                    
                    Image(.item3)
                        .resizable()
                        .overlay {
                            Color(red: 84/255, green: 56/255, blue: 165/255).frame(height: 140).opacity(0.6)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color(red: 4/255, green: 223/255, blue: 114/255).opacity(0.4), lineWidth: 6)
                                        .overlay {
                                            HStack {
                                                Rectangle()
                                                    .fill(Color(red: 61/255, green: 147/255, blue: 115/255).opacity(0.9))
                                                    .overlay {
                                                        Image(.item3Img)
                                                            .resizable()
                                                            .frame(width: 52, height: 52)
                                                    }
                                                    .frame(width: 60, height: 60)
                                                    .cornerRadius(14)
                                                
                                                VStack(alignment: .leading, spacing: 6) {
                                                    Text("Fruit Slots")
                                                        .FontBold(size: 18)
                                                    
                                                    Text("Fresh fruit combinations!")
                                                        .FontRegular(size: 16)
                                                    
                                                    Rectangle()
                                                        .fill(Color(red: 3/255, green: 221/255, blue: 121/255))
                                                        .overlay {
                                                            Text("Min bet: 5 coins")
                                                                .FontSemiBold(size: 12)
                                                        }
                                                        .frame(width: 109, height: 20)
                                                        .cornerRadius(8)
                                                }
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    
                                                }) {
                                                    Image(.rightArrow)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 27, height: 23)
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                }
                        }
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 140)
                        .clipped()
                        .cornerRadius(14)
                        .padding(.horizontal)
                    
                    Image(.item4)
                        .resizable()
                        .overlay {
                            Color(red: 84/255, green: 56/255, blue: 165/255).frame(height: 140).opacity(0.6)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color(red: 123/255, green: 134/255, blue: 255/255).opacity(0.4), lineWidth: 6)
                                        .overlay {
                                            HStack {
                                                Rectangle()
                                                    .fill(Color(red: 152/255, green: 111/255, blue: 186/255).opacity(0.9))
                                                    .overlay {
                                                        Image(.item4Img)
                                                            .resizable()
                                                            .frame(width: 52, height: 52)
                                                    }
                                                    .frame(width: 60, height: 60)
                                                    .cornerRadius(14)
                                                
                                                VStack(alignment: .leading, spacing: 6) {
                                                    Text("Space Slots")
                                                        .FontBold(size: 18)
                                                    
                                                    Text("Cosmic adventures await!")
                                                        .FontRegular(size: 16)
                                                    
                                                    Rectangle()
                                                        .fill(LinearGradient(colors: [Color(red: 123/255, green: 134/255, blue: 255/255),
                                                                                      Color(red: 194/255, green: 122/255, blue: 255/255)], startPoint: .leading, endPoint: .trailing))
                                                        .overlay {
                                                            Text("Min bet: 15 coins")
                                                                .FontSemiBold(size: 12)
                                                        }
                                                        .frame(width: 109, height: 20)
                                                        .cornerRadius(8)
                                                }
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    
                                                }) {
                                                    Image(.rightArrow)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 27, height: 23)
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                }
                        }
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 140)
                        .clipped()
                        .cornerRadius(14)
                        .padding(.horizontal)
                    
                    Image(.item5)
                        .resizable()
                        .overlay {
                            Color(red: 84/255, green: 56/255, blue: 165/255).frame(height: 140).opacity(0.6)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color(red: 81/255, green: 162/255, blue: 255/255).opacity(0.4), lineWidth: 6)
                                        .overlay {
                                            HStack {
                                                Rectangle()
                                                    .fill(Color(red: 91/255, green: 110/255, blue: 218/255).opacity(0.9))
                                                    .overlay {
                                                        Image(.item5Img)
                                                            .resizable()
                                                            .overlay {
                                                                Image("item4BAR")
                                                                    .resizable()
                                                                    .frame(width: 42, height: 26)
                                                            }
                                                            .frame(width: 52, height: 52)
                                                    }
                                                    .frame(width: 60, height: 60)
                                                    .cornerRadius(14)
                                                
                                                VStack(alignment: .leading, spacing: 6) {
                                                    Text("Mega Slots")
                                                        .FontBold(size: 18)
                                                    
                                                    Text("Massive 5x3 grid with mega wins!")
                                                        .FontRegular(size: 16)
                                                    
                                                    Rectangle()
                                                        .fill(LinearGradient(colors: [Color(red: 123/255, green: 134/255, blue: 255/255),
                                                                                      Color(red: 194/255, green: 122/255, blue: 255/255)], startPoint: .leading, endPoint: .trailing))
                                                        .overlay {
                                                            Text("Min bet: 25 coins")
                                                                .FontSemiBold(size: 12)
                                                        }
                                                        .frame(width: 109, height: 20)
                                                        .cornerRadius(8)
                                                }
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    
                                                }) {
                                                    Image(.rightArrow)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 27, height: 23)
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                }
                        }
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 140)
                        .clipped()
                        .cornerRadius(14)
                        .padding(.horizontal)
                    
                    Image(.item6)
                        .resizable()
                        .overlay {
                            Color(red: 84/255, green: 56/255, blue: 165/255).frame(height: 140).opacity(0.6)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color(red: 253/255, green: 199/255, blue: 2/255).opacity(0.4), lineWidth: 6)
                                        .overlay {
                                            HStack {
                                                Rectangle()
                                                    .fill(Color(red: 213/255, green: 140/255, blue: 36/255).opacity(0.9))
                                                    .overlay {
                                                        Image(.item6Img)
                                                            .resizable()
                                                            .frame(width: 52, height: 52)
                                                    }
                                                    .frame(width: 60, height: 60)
                                                    .cornerRadius(14)
                                                
                                                VStack(alignment: .leading, spacing: 6) {
                                                    Text("Gold Slots")
                                                        .FontBold(size: 18)
                                                    
                                                    Text("Golden treasures in 4x3 grid!")
                                                        .FontRegular(size: 16)
                                                    
                                                    Rectangle()
                                                        .fill(LinearGradient(colors: [Color(red: 253/255, green: 199/255, blue: 2/255),
                                                                                      Color(red: 255/255, green: 137/255, blue: 6/255)], startPoint: .leading, endPoint: .trailing))
                                                        .overlay {
                                                            Text("Min bet: 15 coins")
                                                                .FontSemiBold(size: 12)
                                                        }
                                                        .frame(width: 109, height: 20)
                                                        .cornerRadius(8)
                                                }
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    
                                                }) {
                                                    Image(.rightArrow)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 27, height: 23)
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                }
                        }
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 140)
                        .clipped()
                        .cornerRadius(14)
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    MainView()
}

