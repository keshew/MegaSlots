import SwiftUI

struct MegSlotsView: View {
    @StateObject var fruitSlotsModel =  MegSlotsViewModel()
    @State var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            ZStack {
                Image(.megaSlotsBG)
                    .resizable()
                
                LinearGradient(colors: [Color(red: 89/255, green: 22/255, blue: 139/255),
                                        Color(red: 134/255, green: 17/255, blue: 67/255),
                                        Color(red: 134/255, green: 17/255, blue: 67/255)], startPoint: .top, endPoint: .bottom)
                .opacity(0.5)
            }
            .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    Image(.holder5)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: UIScreen.main.bounds.width > 700 ? 180 : 110)
                        .overlay {
                            VStack {
                                HStack {
                                    Button(action: {
                                        NotificationCenter.default.post(name: Notification.Name("UserResourcesUpdated"), object: nil)
                                        presentationMode.wrappedValue.dismiss()
                                    }) {
                                        Image(.megaSlotsBack)
                                            .resizable()
                                            .frame(width: 39, height: 39)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack {
                                        Image(.coin)
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        
                                        HStack(spacing: 5) {
                                            Text("\(fruitSlotsModel.balance)")
                                                .FontSemiBold(size: 20, color: Color(red: 253/255, green: 199/255, blue: 2/255))
                                            
                                            Text("coins")
                                                .FontRegular(size: 16, color: Color(red: 255/255, green: 240/255, blue: 133/255))
                                        }
                                    }
                                }
                                .padding(.horizontal, UIScreen.main.bounds.width > 700 ? 40 : 20)
                                
                                HStack {
                                    Image(.megaSlot6)
                                        .resizable()
                                        .frame(width: 42, height: 26)
                                    
                                    Text("Mega Slots")
                                        .FontBold(size: 24)
                                    
                                    Image(.megaSlot6)
                                        .resizable()
                                        .frame(width: 42, height: 26)
                                }
                            }
                        }
                    
                    Rectangle()
                        .fill(Color(red: 114/255, green: 115/255, blue: 179/255).opacity(0.4))
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: UIScreen.main.bounds.width > 700 ? 480 : 269)
                        .overlay {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(red: 114/255, green: 115/255, blue: 179/255), lineWidth: 5)
                                .overlay {
                                    VStack {
                                        ForEach(0..<3, id: \.self) { row in
                                            HStack {
                                                ForEach(0..<5, id: \.self) { col in
                                                    Rectangle()
                                                        .fill(Color.white.opacity(0.2))
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 10)
                                                                .stroke(Color.gray, lineWidth: 3)
                                                                .overlay {
                                                                    Image(fruitSlotsModel.slots[row][col])
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                                        .frame(width: 36, height: 36)
                                                                }
                                                        }
                                                        .frame(width: 60, height: 60)
                                                        .cornerRadius(10)
                                                        .shadow(
                                                            color: fruitSlotsModel.winningPositions.contains(where: { $0.row == row && $0.col == col }) ? Color(red: 32/255, green: 169/255, blue: 255/255) : .clear,
                                                            radius: fruitSlotsModel.isSpinning ? 0 : 25
                                                        )
                                                }
                                            }
                                        }
                                    }
                                }
                        }
                        .cornerRadius(14)
                    
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color(red: 114/255, green: 115/255, blue: 179/255).opacity(0.4))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 114/255, green: 115/255, blue: 179/255), lineWidth: 6)
                                    .overlay {
                                        VStack {
                                            HStack(alignment: .bottom) {
                                                Button(action: {
                                                    if fruitSlotsModel.bet >= 50 {
                                                        fruitSlotsModel.bet -= 50
                                                    }
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 92/255, green: 123/255, blue: 206/255).opacity(0.4))
                                                        .frame(width: 40, height: 40)
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 8)
                                                                .stroke(Color(red: 92/255, green: 123/255, blue: 206/255), lineWidth: 3)
                                                                .overlay {
                                                                    Text("-")
                                                                        .FontBold(size: 22)
                                                                }
                                                        }
                                                        .cornerRadius(8)
                                                }
                                                
                                                VStack(spacing: 5) {
                                                    Text("Bet Amount:")
                                                        .FontSemiBold(size: 18, color: Color(red: 189/255, green: 219/255, blue: 255/255))
                                                    
                                                    Rectangle()
                                                        .fill(LinearGradient(colors: [Color(red: 43/255, green: 128/255, blue: 255/255),
                                                                                      Color(red: 174/255, green: 70/255, blue: 255/255)], startPoint: .leading, endPoint: .trailing))
                                                        .frame(width: 114, height: 37)
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 6)
                                                                .stroke(Color(red: 80/255, green: 133/255, blue: 255/255), lineWidth: 3)
                                                                .overlay {
                                                                    HStack {
                                                                        Text("\(fruitSlotsModel.bet) coins")
                                                                            .FontBold(size: 18)
                                                                    }
                                                                }
                                                        }
                                                        .cornerRadius(6)
                                                }
                                                
                                                Button(action: {
                                                    if fruitSlotsModel.bet <= fruitSlotsModel.balance - 50 {
                                                        fruitSlotsModel.bet += 50
                                                    }
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 92/255, green: 123/255, blue: 206/255).opacity(0.4))
                                                        .frame(width: 40, height: 40)
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 8)
                                                                .stroke(Color(red: 92/255, green: 123/255, blue: 206/255), lineWidth: 3)
                                                                .overlay {
                                                                    Text("+")
                                                                        .FontBold(size: 22)
                                                                }
                                                        }
                                                        .cornerRadius(8)
                                                }
                                                
                                            }
                                        }
                                        .padding(.bottom, 10)
                                    }
                            }
                            .frame(width: UIScreen.main.bounds.size.width - 30,  height: 97)
                            .cornerRadius(14)
                        
                        Button(action: {
                            if fruitSlotsModel.balance != 0 {
                                fruitSlotsModel.spin()
                                fruitSlotsModel.balance -= fruitSlotsModel.bet
                                UserDefaultsManager.shared.subtractCoins(fruitSlotsModel.bet)
                                UserDefaultsManager.shared.incrementMegaSlotSpins()
                                UserDefaultsManager.shared.incrementSpinsCount()
                            } else {
                                showAlert = true
                            }
                        }) {
                            Rectangle()
                                .fill(LinearGradient(colors: [Color(red: 43/255, green: 128/255, blue: 255/255),
                                                              Color(red: 174/255, green: 70/255, blue: 255/255)], startPoint: .leading, endPoint: .trailing))
                                .frame(width: 155, height: 36)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color(red: 80/255, green: 133/255, blue: 255/255), lineWidth: 3)
                                        .overlay {
                                            HStack {
                                                Image(systemName: "play")
                                                    .foregroundStyle(.white)
                                                
                                                Text("MEGA SPIN")
                                                    .FontBold(size: 18)
                                            }
                                        }
                                }
                                .cornerRadius(6)
                        }
                        .offset(y: 23)
                        .disabled(fruitSlotsModel.isSpinning)
                        .opacity(fruitSlotsModel.isSpinning ? 0.5 : 1)
                    }
                    
                    Rectangle()
                        .fill(Color(red: 114/255, green: 115/255, blue: 179/255).opacity(0.4))
                        .overlay {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(red: 114/255, green: 115/255, blue: 179/255), lineWidth: 6)
                                .overlay {
                                    VStack {
                                        HStack {
                                            Image(.megaSlot6)
                                                .resizable()
                                                .frame(width: 34, height: 21)
                                            
                                            Text("Fresh Paytable")
                                                .FontBold(size: 20, color: Color(red: 81/255, green: 162/255, blue: 255/255))
                                            
                                            Image(.megaSlot6)
                                                .resizable()
                                                .frame(width: 34, height: 21)
                                        }
                                        
                                        VStack {
                                            HStack {
                                                Rectangle()
                                                    .fill(Color(red: 111/255, green: 45/255, blue: 110/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 111/255, green: 73/255, blue: 154/255).opacity(0.2), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("5x")
                                                                        .FontRegular(size: 18, color: Color(red: 189/255, green: 219/255, blue: 255/255))
                                                                    
                                                                    Image(.megaSlot1)
                                                                        .resizable()
                                                                        .frame(width: 29, height: 27)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 43/255, green: 128/255, blue: 255/255),
                                                                                                      Color(red: 174/255, green: 70/255, blue: 255/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("2000x")
                                                                                .FontBold(size: 12)
                                                                        }
                                                                        .frame(width: 45, height: 20)
                                                                        .cornerRadius(8)
                                                                }
                                                                .padding(.horizontal)
                                                            }
                                                    }
                                                    .frame(width: 170, height: 58)
                                                    .cornerRadius(10)
                                                
                                                Rectangle()
                                                    .fill(Color(red: 111/255, green: 45/255, blue: 110/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 111/255, green: 73/255, blue: 154/255).opacity(0.2), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("5x")
                                                                        .FontRegular(size: 18, color: Color(red: 189/255, green: 219/255, blue: 255/255))
                                                                    
                                                                    Image(.megaSlot2)
                                                                        .resizable()
                                                                        .frame(width: 29, height: 27)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 43/255, green: 128/255, blue: 255/255),
                                                                                                      Color(red: 174/255, green: 70/255, blue: 255/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("1500x")
                                                                                .FontBold(size: 12)
                                                                        }
                                                                        .frame(width: 45, height: 20)
                                                                        .cornerRadius(8)
                                                                }
                                                                .padding(.horizontal)
                                                            }
                                                    }
                                                    .frame(width: 170, height: 58)
                                                    .cornerRadius(10)
                                            }
                                            
                                            HStack {
                                                Rectangle()
                                                    .fill(Color(red: 111/255, green: 45/255, blue: 110/255).opacity(0.6))
                                                    .overlay {
                                                        HStack {
                                                            Text("5x")
                                                                .FontRegular(size: 18, color: Color(red: 189/255, green: 219/255, blue: 255/255))
                                                            
                                                            Image(.megaSlot3)
                                                                .resizable()
                                                                .frame(width: 29, height: 32)
                                                            
                                                            Spacer()
                                                            
                                                            Rectangle()
                                                                .fill(LinearGradient(colors: [Color(red: 43/255, green: 128/255, blue: 255/255),
                                                                                              Color(red: 174/255, green: 70/255, blue: 255/255)], startPoint: .leading, endPoint: .trailing))
                                                                .overlay {
                                                                    Text("1200x")
                                                                        .FontBold(size: 12)
                                                                }
                                                                .frame(width: 45, height: 20)
                                                                .cornerRadius(8)
                                                        }
                                                        .padding(.horizontal)
                                                    }
                                                    .frame(width: 170, height: 58)
                                                    .cornerRadius(10)
                                                
                                                Rectangle()
                                                    .fill(Color(red: 111/255, green: 45/255, blue: 110/255).opacity(0.6))
                                                    .overlay {
                                                        HStack {
                                                            Text("5x")
                                                                .FontRegular(size: 18, color: Color(red: 189/255, green: 219/255, blue: 255/255))
                                                            
                                                            Image(.megaSlot4)
                                                                .resizable()
                                                                .frame(width: 29, height: 26)
                                                            
                                                            Spacer()
                                                            
                                                            Rectangle()
                                                                .fill(LinearGradient(colors: [Color(red: 43/255, green: 128/255, blue: 255/255),
                                                                                              Color(red: 174/255, green: 70/255, blue: 255/255)], startPoint: .leading, endPoint: .trailing))
                                                                .overlay {
                                                                    Text("1000x")
                                                                        .FontBold(size: 12)
                                                                }
                                                                .frame(width: 45, height: 20)
                                                                .cornerRadius(8)
                                                        }
                                                        .padding(.horizontal)
                                                    }
                                                    .frame(width: 170, height: 58)
                                                    .cornerRadius(10)
                                            }
                                            
                                            HStack {
                                                Rectangle()
                                                    .fill(Color(red: 111/255, green: 45/255, blue: 110/255).opacity(0.6))
                                                    .overlay {
                                                        HStack {
                                                            Text("4x")
                                                                .FontRegular(size: 18, color: Color(red: 189/255, green: 219/255, blue: 255/255))
                                                            
                                                            Image(.megaSlot5)
                                                                .resizable()
                                                                .frame(width: 29, height: 30)
                                                            
                                                            Spacer()
                                                            
                                                            Rectangle()
                                                                .fill(LinearGradient(colors: [Color(red: 43/255, green: 128/255, blue: 255/255),
                                                                                              Color(red: 174/255, green: 70/255, blue: 255/255)], startPoint: .leading, endPoint: .trailing))
                                                                .overlay {
                                                                    Text("400x")
                                                                        .FontBold(size: 12)
                                                                }
                                                                .frame(width: 45, height: 20)
                                                                .cornerRadius(8)
                                                        }
                                                        .padding(.horizontal)
                                                    }
                                                    .frame(width: 170, height: 58)
                                                    .cornerRadius(10)
                                                
                                                Rectangle()
                                                    .fill(Color(red: 111/255, green: 45/255, blue: 110/255).opacity(0.6))
                                                    .overlay {
                                                        HStack {
                                                            Text("3x")
                                                                .FontRegular(size: 18, color: Color(red: 189/255, green: 219/255, blue: 255/255))
                                                            
                                                            Image(.megaSlot6)
                                                                .resizable()
                                                                .frame(width: 29, height: 18)
                                                            
                                                            Spacer()
                                                            
                                                            Rectangle()
                                                                .fill(LinearGradient(colors: [Color(red: 43/255, green: 128/255, blue: 255/255),
                                                                                              Color(red: 174/255, green: 70/255, blue: 255/255)], startPoint: .leading, endPoint: .trailing))
                                                                .overlay {
                                                                    Text("100x")
                                                                        .FontBold(size: 12)
                                                                }
                                                                .frame(width: 45, height: 20)
                                                                .cornerRadius(8)
                                                        }
                                                        .padding(.horizontal)
                                                    }
                                                    .frame(width: 170, height: 58)
                                                    .cornerRadius(10)
                                            }
                                        }
                                    }
                                }
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: 239)
                        .cornerRadius(14)
                        .padding(.top, 25)
                }
            }
            
            if fruitSlotsModel.isWin {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                        .opacity(0.6)
                    
                    VStack {
                        Image(.megaSlotsWin)
                            .resizable()
                            .frame(width: 397, height: 597)
                        
                        HStack {
                            Text("+\(fruitSlotsModel.win)")
                                .FontBold(size: 50, color: Color(red: 3/255, green: 147/255, blue: 218/255))
                                .outlineText(color: .white, width: 1)
                            
                            Image(.coin2)
                                .resizable()
                                .frame(width: 41, height: 39)
                        }
                        
                        Button(action: {
                            fruitSlotsModel.isWin.toggle()
                        }) {
                            Image(.claimMegaSlots)
                                .resizable()
                                .frame(width: 146, height: 42)
                        }
                        .padding(.top, 40)
                    }
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Not enough coins"),
                message: Text("You do not have enough coins to spin."),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}

#Preview {
    MegSlotsView()
}

