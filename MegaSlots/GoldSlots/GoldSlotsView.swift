import SwiftUI

struct GoldSlotsView: View {
    @StateObject var fruitSlotsModel =  GoldSlotsViewModel()
    @State var showAlert = false
    
    var body: some View {
        ZStack {
            ZStack {
                Image(.bgGoldSlots)
                    .resizable()
                
                LinearGradient(colors: [Color(red: 241/255, green: 177/255, blue: 0/255),
                                        Color(red: 254/255, green: 105/255, blue: 0/255),
                                        Color(red: 254/255, green: 154/255, blue: 2/255)], startPoint: .top, endPoint: .bottom)
                .opacity(0.5)
            }
            .ignoresSafeArea()
            .aspectRatio(contentMode: .fill)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    Image(.holderGold)
                        .resizable()
                        .overlay {
                            VStack {
                                HStack {
                                    Button(action: {
                                        
                                    }) {
                                        Image(.backGoldSlots)
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
                                                .FontSemiBold(size: 20)
                                            
                                            Text("coins")
                                                .FontRegular(size: 16, color: Color(red: 255/255, green: 240/255, blue: 133/255))
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                
                                HStack {
                                    Image(.goldSlots1)
                                        .resizable()
                                        .frame(width: 40, height: 39)
                                    
                                    Text("Gold Slots")
                                        .FontBold(size: 24)
                                    
                                    Image(.goldSlots1)
                                        .resizable()
                                        .frame(width: 40, height: 39)
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: 110)
                    
                    Rectangle()
                        .fill(Color(red: 225/255, green: 160/255, blue: 18/255).opacity(0.1))
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: 269)
                        .overlay {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(red: 225/255, green: 160/255, blue: 18/255), lineWidth: 5)
                                .overlay {
                                    VStack {
                                        ForEach(0..<3, id: \.self) { row in
                                            HStack {
                                                ForEach(0..<4, id: \.self) { col in
                                                    Rectangle()
                                                        .fill(Color(red: 249/255, green: 189/255, blue: 1/255).opacity(0.6))
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 10)
                                                                .stroke(Color(red: 249/255, green: 189/255, blue: 1/255), lineWidth: 4)
                                                                .overlay {
                                                                    Image(fruitSlotsModel.slots[row][col])
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                                        .frame(width: 46, height: 46)
                                                                }
                                                        }
                                                        .frame(width: 75, height: 70)
                                                        .cornerRadius(10)
                                                        .shadow(
                                                            color: fruitSlotsModel.winningPositions.contains(where: { $0.row == row && $0.col == col }) ? Color(red: 255/255, green: 205/255, blue: 0/255) : .clear,
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
                            .fill(Color(red: 249/255, green: 189/255, blue: 1/255).opacity(0.4))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color(red: 249/255, green: 189/255, blue: 1/255), lineWidth: 6)
                                    .overlay {
                                        VStack {
                                            HStack(alignment: .bottom) {
                                                Button(action: {
                                                    if fruitSlotsModel.bet >= 50 {
                                                        fruitSlotsModel.bet -= 50
                                                    }
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 231/255, green: 150/255, blue: 13/255).opacity(0.4))
                                                        .frame(width: 40, height: 40)
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 8)
                                                                .stroke(Color(red: 231/255, green: 150/255, blue: 13/255), lineWidth: 3)
                                                                .overlay {
                                                                    Text("-")
                                                                        .FontBold(size: 22)
                                                                }
                                                        }
                                                        .cornerRadius(8)
                                                }
                                                
                                                VStack(spacing: 5) {
                                                    Text("Golden Bet:")
                                                        .FontSemiBold(size: 18, color: Color(red: 253/255, green: 230/255, blue: 133/255))
                                                    
                                                    Rectangle()
                                                        .fill(LinearGradient(colors: [Color(red: 241/255, green: 177/255, blue: 0/255),
                                                                                      Color(red: 254/255, green: 105/255, blue: 0/255)], startPoint: .leading, endPoint: .trailing))
                                                        .frame(width: 114, height: 37)
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 6)
                                                                .stroke(Color(red: 249/255, green: 189/255, blue: 1/255), lineWidth: 3)
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
                                                        .fill(Color(red: 231/255, green: 150/255, blue: 13/255).opacity(0.4))
                                                        .frame(width: 40, height: 40)
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 8)
                                                                .stroke(Color(red: 231/255, green: 150/255, blue: 13/255), lineWidth: 3)
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
                                .fill(LinearGradient(colors: [Color(red: 241/255, green: 177/255, blue: 0/255),
                                                              Color(red: 254/255, green: 105/255, blue: 0/255)], startPoint: .leading, endPoint: .trailing))
                                .frame(width: 155, height: 36)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color(red: 249/255, green: 189/255, blue: 1/255), lineWidth: 3)
                                        .overlay {
                                            HStack {
                                                Image(systemName: "play")
                                                    .foregroundStyle(.white)
                                                
                                                Text("GOLS SPIN")
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
                        .fill(Color(red: 184/255, green: 108/255, blue: 10/255).opacity(0.6))
                        .overlay {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(red: 249/255, green: 189/255, blue: 1/255), lineWidth: 6)
                                .overlay {
                                    VStack {
                                        HStack {
                                            Image(.goldSlots1)
                                                .resizable()
                                                .frame(width: 30, height: 29)
                                            
                                            Text("Golden Paytable")
                                                .FontBold(size: 20, color: Color(red: 253/255, green: 199/255, blue: 2/255))
                                            
                                            Image(.goldSlots1)
                                                .resizable()
                                                .frame(width: 30, height: 29)
                                        }
                                        
                                        VStack {
                                            HStack {
                                                Rectangle()
                                                    .fill(Color(red: 184/255, green: 108/255, blue: 10/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 249/255, green: 189/255, blue: 1/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("4x")
                                                                        .FontRegular(size: 18, color: Color(red: 253/255, green: 230/255, blue: 133/255))
                                                                    
                                                                    Image(.goldSlots1)
                                                                        .resizable()
                                                                        .frame(width: 35, height: 34)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 241/255, green: 177/255, blue: 0/255),
                                                                                                      Color(red: 254/255, green: 105/255, blue: 0/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("1000x")
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
                                                    .fill(Color(red: 184/255, green: 108/255, blue: 10/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 249/255, green: 189/255, blue: 1/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("4x")
                                                                        .FontRegular(size: 18, color: Color(red: 253/255, green: 230/255, blue: 133/255))
                                                                    
                                                                    Image(.goldSlots4)
                                                                        .resizable()
                                                                        .frame(width: 36, height: 26)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 241/255, green: 177/255, blue: 0/255),
                                                                                                      Color(red: 254/255, green: 105/255, blue: 0/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("800x")
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
                                                    .fill(Color(red: 184/255, green: 108/255, blue: 10/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 249/255, green: 189/255, blue: 1/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("4x")
                                                                        .FontRegular(size: 18, color: Color(red: 253/255, green: 230/255, blue: 133/255))
                                                                    
                                                                    Image(.goldSlots2)
                                                                        .resizable()
                                                                        .frame(width: 37, height: 35)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 241/255, green: 177/255, blue: 0/255),
                                                                                                      Color(red: 254/255, green: 105/255, blue: 0/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("600x")
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
                                                    .fill(Color(red: 184/255, green: 108/255, blue: 10/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 249/255, green: 189/255, blue: 1/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("4x")
                                                                        .FontRegular(size: 18, color: Color(red: 253/255, green: 230/255, blue: 133/255))
                                                                    
                                                                    Image(.goldSlots5)
                                                                        .resizable()
                                                                        .frame(width: 35, height: 25)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 241/255, green: 177/255, blue: 0/255),
                                                                                                      Color(red: 254/255, green: 105/255, blue: 0/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("500x")
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
                                                    .fill(Color(red: 184/255, green: 108/255, blue: 10/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 249/255, green: 189/255, blue: 1/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("3x")
                                                                        .FontRegular(size: 18, color: Color(red: 253/255, green: 230/255, blue: 133/255))
                                                                    
                                                                    Image(.goldSlots3)
                                                                        .resizable()
                                                                        .frame(width: 32, height: 33)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 241/255, green: 177/255, blue: 0/255),
                                                                                                      Color(red: 254/255, green: 105/255, blue: 0/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("150x")
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
                                                    .fill(Color(red: 184/255, green: 108/255, blue: 10/255).opacity(0.6))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 249/255, green: 189/255, blue: 1/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("3x")
                                                                        .FontRegular(size: 18, color: Color(red: 253/255, green: 230/255, blue: 133/255))
                                                                    
                                                                    Image(.goldSlots6)
                                                                        .resizable()
                                                                        .frame(width: 29, height: 29)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Rectangle()
                                                                        .fill(LinearGradient(colors: [Color(red: 241/255, green: 177/255, blue: 0/255),
                                                                                                      Color(red: 254/255, green: 105/255, blue: 0/255)], startPoint: .leading, endPoint: .trailing))
                                                                        .overlay {
                                                                            Text("120x")
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
                                        }
                                    }
                                }
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: 249)
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
                        Image(.goldenWin)
                            .resizable()
                            .frame(width: 397, height: 597)
                        
                        HStack {
                            Text("+\(fruitSlotsModel.win)")
                                .FontBold(size: 50, color: Color(red: 218/255, green: 187/255, blue: 7/255))
                                .outlineText(color: .white, width: 1)
                            
                            Image(.coin2)
                                .resizable()
                                .frame(width: 41, height: 39)
                        }
                        
                        Button(action: {
                            fruitSlotsModel.isWin.toggle()
                        }) {
                            Image(.claimGold)
                                .resizable()
                                .frame(width: 146, height: 62)
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
    GoldSlotsView()
}

