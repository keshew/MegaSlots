import SwiftUI

struct MinesGameView: View {
    @StateObject var fruitSlotsModel =  MinesGameViewModel()
    @State var showAlert = false
    @State private var isPlaying: Bool = false
    let grid5 = Array(repeating: GridItem(.flexible(), spacing: 0), count: 5)
    
    var body: some View {
        ZStack {
            ZStack {
                Image("minesBG")
                    .resizable()
                
                LinearGradient(colors: [Color(red: 0/255, green: 90/255, blue: 201/255),
                                        Color(red: 1/255, green: 132/255, blue: 187/255),
                                        Color(red: 0/255, green: 147/255, blue: 201/255)], startPoint: .top, endPoint: .bottom)
                .opacity(0.5)
            }
            .ignoresSafeArea()
            .aspectRatio(contentMode: .fill)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    Image(.holder5)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: 110)
                        .overlay {
                            VStack {
                                HStack {
                                    Button(action: {
                                        
                                    }) {
                                        Image(.minesBack)
                                            .resizable()
                                            .frame(width: 35, height: 35)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack {
                                        Image(.coin)
                                            .resizable()
                                            .frame(width: 35, height: 35)
                                        
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
                                    Image(.dimond)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 31, height: 28)
                                    
                                    Text("Mines Game")
                                        .FontBold(size: 24)
                                    
                                    Image(.dimond)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 31, height: 28)
                                }
                            }
                        }
                    
                    ZStack(alignment: .top) {
                        Image(.minesDesc)
                            .resizable()
                            .overlay {
                                Rectangle()
                                    .fill(Color(red: 38/255, green: 19/255, blue: 30/255).opacity(0.7))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(Color(red: 4/255, green: 144/255, blue: 224/255), lineWidth: 5)
                                            .overlay {
                                                LazyVGrid(columns: grid5, spacing: 10) {
                                                    ForEach(0..<25, id: \.self) { _ in
                                                        Rectangle()
                                                            .fill(.gray)
                                                            .frame(width: 45, height: 45)
                                                            .overlay {
                                                                RoundedRectangle(cornerRadius: 8)
                                                                    .stroke(.white, lineWidth: 3)
                                                            }
                                                            .cornerRadius(8)
                                                    }
                                                }
                                                .padding(10)
                                            }
                                    )
                                    .frame(width: 316, height: 318)
                                    .cornerRadius(14)
                            }
                            .frame(width: UIScreen.main.bounds.size.width - 30,  height: 389)
                            .padding(.top, 15)
                        
                        Rectangle()
                            .fill(LinearGradient(colors: [Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                            .frame(width: 95, height: 40)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                    .overlay {
                                        HStack {
                                            Text("X 1.23")
                                                .FontBold(size: 15, color: .green)
                                                .outlineText(color: .white, width: 0.5)
                                        }
                                    }
                            }
                            .cornerRadius(6)
                    }
                    
                    Rectangle()
                        .fill(Color(red: 4/255, green: 144/255, blue: 224/255).opacity(0.2))
                        .overlay {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(red: 4/255, green: 144/255, blue: 224/255), lineWidth: 6)
                                .overlay {
                                    VStack(spacing: 13) {
                                        HStack(alignment: .bottom) {
                                            Button(action: {
                                                if fruitSlotsModel.bet >= 50 {
                                                    fruitSlotsModel.bet -= 50
                                                }
                                            }) {
                                                Rectangle()
                                                    .fill(Color(red: 10/255, green: 126/255, blue: 190/255).opacity(0.4))
                                                    .frame(width: 40, height: 40)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 8)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                Text("-")
                                                                    .FontBold(size: 22)
                                                            }
                                                    }
                                                    .cornerRadius(8)
                                            }
                                            
                                            VStack(spacing: 5) {
                                                Text("Bet Amount:")
                                                    .FontSemiBold(size: 18, color: Color(red: 184/255, green: 241/255, blue: 248/255))
                                                
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 1/255, green: 138/255, blue: 207/255),
                                                                                  Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("\(fruitSlotsModel.bet) coins")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .frame(width: 114, height: 37)
                                                    .cornerRadius(6)
                                            }
                                            
                                            Button(action: {
                                                if fruitSlotsModel.bet <= fruitSlotsModel.balance - 50 {
                                                    fruitSlotsModel.bet += 50
                                                }
                                            }) {
                                                Rectangle()
                                                    .fill(Color(red: 10/255, green: 126/255, blue: 190/255).opacity(0.4))
                                                    .frame(width: 40, height: 40)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 8)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                Text("+")
                                                                    .FontBold(size: 22)
                                                            }
                                                    }
                                                    .cornerRadius(8)
                                            }
                                            
                                        }
                                        
                                        Text("Mines Amount:")
                                            .FontSemiBold(size: 18, color: Color(red: 184/255, green: 241/255, blue: 248/255))
                                        
                                        HStack {
                                            Button(action: {
                                                fruitSlotsModel.bet = fruitSlotsModel.balance / 2
                                            }) {
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 1/255, green: 138/255, blue: 207/255),
                                                                                  Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: 75, height: 30)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("3")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .cornerRadius(6)
                                            }
                                            
                                            Button(action: {
                                                fruitSlotsModel.bet = fruitSlotsModel.balance / 4
                                            }) {
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 1/255, green: 138/255, blue: 207/255),
                                                                                  Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: 75, height: 30)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("4")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .cornerRadius(6)
                                            }
                                            
                                            Button(action: {
                                                fruitSlotsModel.bet = fruitSlotsModel.balance / 8
                                            }) {
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 1/255, green: 138/255, blue: 207/255),
                                                                                  Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: 75, height: 30)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("5")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .cornerRadius(6)
                                            }
                                            
                                            Button(action: {
                                                fruitSlotsModel.bet = fruitSlotsModel.balance / 16
                                            }) {
                                                Rectangle()
                                                    .fill(LinearGradient(colors: [Color(red: 1/255, green: 138/255, blue: 207/255),
                                                                                  Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: 75, height: 30)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                            .overlay {
                                                                HStack {
                                                                    Text("6")
                                                                        .FontBold(size: 18)
                                                                }
                                                            }
                                                    }
                                                    .cornerRadius(6)
                                            }
                                        }
                                        
                                        Button(action: {
                                      
                                        }) {
                                            Rectangle()
                                                .fill(LinearGradient(colors: [Color(red: 1/255, green: 138/255, blue: 207/255),
                                                                              Color(red: 0/255, green: 100/255, blue: 188/255)], startPoint: .leading, endPoint: .trailing))
                                                .frame(width: 95, height: 30)
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 6)
                                                        .stroke(Color(red: 10/255, green: 126/255, blue: 190/255), lineWidth: 3)
                                                        .overlay {
                                                            HStack {
                                                                Text(isPlaying ? "CLAIM" : "LAUNCH")
                                                                    .FontBold(size: 15)
                                                            }
                                                        }
                                                }
                                                .cornerRadius(6)
                                        }
                                        .disabled(fruitSlotsModel.bet > fruitSlotsModel.balance)
                                        .alert(isPresented: $showAlert) {
                                            Alert(
                                                title: Text("Not enough coins"),
                                                message: Text("You do not have enough coins to spin."),
                                                dismissButton: .default(Text("Ok"))
                                            )
                                        }
                                    }
                                }
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 30,  height: 207)
                        .cornerRadius(14)
                }
            }
        }
    }
}

#Preview {
    MinesGameView()
}

