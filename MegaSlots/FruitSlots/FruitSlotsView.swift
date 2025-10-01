import SwiftUI

struct FruitSlotsView: View {
    @StateObject var fruitSlotsModel =  FruitSlotsViewModel()
    @State var showAlert = false
    var body: some View {
        ZStack {
            ZStack {
                Image(.fruitSlotBG)
                    .resizable()
                   
                LinearGradient(colors: [Color(red: 65/255, green: 139/255, blue: 21/255),
                                        Color(red: 18/255, green: 134/255, blue: 17/255),
                                        Color(red: 14/255, green: 134/255, blue: 38/255)], startPoint: .top, endPoint: .bottom)
                    .opacity(0.5)
            }
            .ignoresSafeArea()
            .aspectRatio(contentMode: .fill)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    Rectangle()
                        .fill(Color(red: 60/255, green: 195/255, blue: 71/255).opacity(0.4))
                        .overlay {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(red: 60/255, green: 195/255, blue: 71/255), lineWidth: 6)
                                .overlay {
                                    VStack {
                                        HStack {
                                            Button(action: {
                                                
                                            }) {
                                                Image(.fruitSlotsBack)
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
                                        .padding(.horizontal)
                                        
                                        HStack {
                                            Image(.fruitSlot1)
                                                .resizable()
                                                .frame(width: 36, height: 36)
                                            
                                            Text("Fruit Slots")
                                                .FontBold(size: 30)
                                            
                                            Image(.fruitSlot1)
                                                .resizable()
                                                .frame(width: 36, height: 36)
                                        }
                                    }
                                }
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: 110)
                        .cornerRadius(14)
                    
                    Image(.fruitDesc)
                        .resizable()
                        .overlay {
                            Rectangle()
                                .fill(Color(red: 32/255, green: 48/255, blue: 23/255))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color(red: 8/255, green: 222/255, blue: 114/255), lineWidth: 3)
                                        .overlay {
                                            VStack {
                                                ForEach(0..<3, id: \.self) { row in
                                                    HStack {
                                                        ForEach(0..<3, id: \.self) { col in
                                                            Rectangle()
                                                                .fill(Color(red: 204/255, green: 202/255, blue: 174/255))
                                                                .overlay {
                                                                    RoundedRectangle(cornerRadius: 10)
                                                                        .stroke(Color(red: 237/255, green: 212/255, blue: 111/255), lineWidth: 3)
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
                                                                    color: fruitSlotsModel.winningPositions.contains(where: { $0.row == row && $0.col == col }) ? .green : .clear,
                                                                    radius: fruitSlotsModel.isSpinning ? 0 : 25
                                                                )
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                }
                                .frame(width: 316, height: 228)
                                .cornerRadius(14)
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: 269)
                    
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color(red: 104/255, green: 187/255, blue: 8/255).opacity(0.4))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 104/255, green: 187/255, blue: 8/255), lineWidth: 6)
                                    .overlay {
                                        VStack {
                                            HStack(alignment: .bottom) {
                                                Button(action: {
                                                    if fruitSlotsModel.bet >= 50 {
                                                        fruitSlotsModel.bet -= 50
                                                    }
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 104/255, green: 187/255, blue: 8/255).opacity(0.4))
                                                        .frame(width: 40, height: 40)
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 8)
                                                                .stroke(Color(red: 113/255, green: 185/255, blue: 15/255), lineWidth: 3)
                                                                .overlay {
                                                                    Text("-")
                                                                        .FontBold(size: 22)
                                                                }
                                                        }
                                                        .cornerRadius(8)
                                                }
                                                
                                                VStack(spacing: 5) {
                                                    Text("Bet Amount:")
                                                        .FontSemiBold(size: 18, color: Color(red: 185/255, green: 248/255, blue: 207/255))
                                                    
                                                    Rectangle()
                                                        .fill(LinearGradient(colors: [Color(red: 124/255, green: 206/255, blue: 0/255),
                                                                                      Color(red: 0/255, green: 188/255, blue: 125/255)], startPoint: .leading, endPoint: .trailing))
                                                        .frame(width: 114, height: 37)
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 6)
                                                                .stroke(Color(red: 126/255, green: 214/255, blue: 9/255), lineWidth: 3)
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
                                                        .fill(Color(red: 104/255, green: 187/255, blue: 8/255).opacity(0.4))
                                                        .frame(width: 40, height: 40)
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 8)
                                                                .stroke(Color(red: 113/255, green: 185/255, blue: 15/255), lineWidth: 3)
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
                            } else {
                                showAlert = true
                            }
                        }) {
                            Rectangle()
                                .fill(LinearGradient(colors: [Color(red: 0/255, green: 201/255, blue: 80/255),
                                                              Color(red: 0/255, green: 188/255, blue: 125/255)], startPoint: .leading, endPoint: .trailing))
                                .frame(width: 135, height: 36)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color(red: 5/255, green: 211/255, blue: 100/255), lineWidth: 3)
                                        .overlay {
                                            HStack {
                                                Image(systemName: "play")
                                                    .foregroundStyle(.white)
                                                
                                                Text("SPIN")
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
                        .fill(Color(red: 24/255, green: 115/255, blue: 89/255).opacity(0.4))
                        .overlay {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(red: 24/255, green: 115/255, blue: 89/255), lineWidth: 6)
                                .overlay {
                                    VStack {
                                        HStack {
                                            Image(.fruitSlot1)
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                            
                                            Text("Fresh Paytable")
                                                .FontBold(size: 20, color: Color(red: 0/255, green: 219/255, blue: 128/255))
                                            
                                            Image(.fruitSlot1)
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                        }
                                        
                                        VStack {
                                            HStack {
                                                Rectangle()
                                                    .fill(Color(red: 1/255, green: 102/255, blue: 48/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 4/255, green: 223/255, blue: 114/255).opacity(0.2), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    ForEach(0..<3, id: \.self) { index in
                                                                        Image(.fruitSlot2)
                                                                            .resizable()
                                                                            .frame(width: 26, height: 20)
                                                                    }
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 0/255, green: 201/255, blue: 80/255),
                                                                                                      Color(red: 0/255, green: 188/255, blue: 125/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("150x")
                                                                                .FontBold(size: 12)
                                                                        }
                                                                        .frame(width: 45, height: 20)
                                                                        .cornerRadius(8)
                                                                }
                                                            }
                                                    }
                                                    .frame(width: 170, height: 58)
                                                    .cornerRadius(10)
                                                
                                                Rectangle()
                                                    .fill(Color(red: 1/255, green: 102/255, blue: 48/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 4/255, green: 223/255, blue: 114/255).opacity(0.2), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    ForEach(0..<3, id: \.self) { index in
                                                                        Image(.fruitSlot3)
                                                                            .resizable()
                                                                            .frame(width: 26, height: 20)
                                                                    }
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 0/255, green: 201/255, blue: 80/255),
                                                                                                      Color(red: 0/255, green: 188/255, blue: 125/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("120x")
                                                                                .FontBold(size: 12)
                                                                        }
                                                                        .frame(width: 45, height: 20)
                                                                        .cornerRadius(8)
                                                                }
                                                            }
                                                    }
                                                    .frame(width: 170, height: 58)
                                                    .cornerRadius(10)
                                            }
                                            
                                            HStack {
                                                Rectangle()
                                                    .fill(Color(red: 1/255, green: 102/255, blue: 48/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 4/255, green: 223/255, blue: 114/255).opacity(0.2), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    ForEach(0..<3, id: \.self) { index in
                                                                        Image(.fruitSlot4)
                                                                            .resizable()
                                                                            .frame(width: 26, height: 27)
                                                                    }
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 0/255, green: 201/255, blue: 80/255),
                                                                                                      Color(red: 0/255, green: 188/255, blue: 125/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("100x")
                                                                                .FontBold(size: 12)
                                                                        }
                                                                        .frame(width: 45, height: 20)
                                                                        .cornerRadius(8)
                                                                }
                                                            }
                                                    }
                                                    .frame(width: 170, height: 58)
                                                    .cornerRadius(10)
                                                
                                                Rectangle()
                                                    .fill(Color(red: 1/255, green: 102/255, blue: 48/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 4/255, green: 223/255, blue: 114/255).opacity(0.2), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    ForEach(0..<3, id: \.self) { index in
                                                                        Image(.fruitSlot5)
                                                                            .resizable()
                                                                            .frame(width: 26, height: 26)
                                                                    }
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 0/255, green: 201/255, blue: 80/255),
                                                                                                      Color(red: 0/255, green: 188/255, blue: 125/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("80x")
                                                                                .FontBold(size: 12)
                                                                        }
                                                                        .frame(width: 45, height: 20)
                                                                        .cornerRadius(8)
                                                                }
                                                            }
                                                    }
                                                    .frame(width: 170, height: 58)
                                                    .cornerRadius(10)
                                            }
                                            
                                            HStack {
                                                Rectangle()
                                                    .fill(Color(red: 1/255, green: 102/255, blue: 48/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 4/255, green: 223/255, blue: 114/255).opacity(0.2), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    ForEach(0..<3, id: \.self) { index in
                                                                        Image(.fruitSlot6)
                                                                            .resizable()
                                                                            .frame(width: 26, height: 27)
                                                                    }
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 0/255, green: 201/255, blue: 80/255),
                                                                                                      Color(red: 0/255, green: 188/255, blue: 125/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("75x")
                                                                                .FontBold(size: 12)
                                                                        }
                                                                        .frame(width: 45, height: 20)
                                                                        .cornerRadius(8)
                                                                }
                                                            }
                                                    }
                                                    .frame(width: 170, height: 58)
                                                    .cornerRadius(10)
                                                
                                                Rectangle()
                                                    .fill(Color(red: 1/255, green: 102/255, blue: 48/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 4/255, green: 223/255, blue: 114/255).opacity(0.2), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    ForEach(0..<3, id: \.self) { index in
                                                                        Image(.fruitSlot1)
                                                                            .resizable()
                                                                            .frame(width: 26, height: 26)
                                                                    }
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 0/255, green: 201/255, blue: 80/255),
                                                                                                      Color(red: 0/255, green: 188/255, blue: 125/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("60x")
                                                                                .FontBold(size: 12)
                                                                        }
                                                                        .frame(width: 45, height: 20)
                                                                        .cornerRadius(8)
                                                                }
                                                            }
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
                        Image(.fruitWin)
                            .resizable()
                            .frame(width: 397, height: 597)
                        
                        HStack {
                            Text("+\(fruitSlotsModel.win)")
                                .FontBold(size: 50, color: Color(red: 0/255, green: 195/255, blue: 99/255))
                                .outlineText(color: .white, width: 1)
                            
                            Image(.coin2)
                                .resizable()
                                .frame(width: 41, height: 39)
                        }
                        
                        Button(action: {
                            fruitSlotsModel.isWin.toggle()
                        }) {
                            Image(.claimFruit)
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
    FruitSlotsView()
}
 
