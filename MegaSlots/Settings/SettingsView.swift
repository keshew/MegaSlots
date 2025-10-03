import SwiftUI

struct SettingsView: View {
    @StateObject var settingsModel =  SettingsViewModel()
 
    @Environment(\.presentationMode) var presentationMode
    @State var showAlert = false
    
    var body: some View {
        ZStack {
            Image(.bgMain)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color(red: 107/255, green: 0/255, blue: 66/255))
                    .overlay {
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color(red: 142/255, green: 49/255, blue: 142/255), lineWidth: 6)
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
                                                Text("\(settingsModel.coins)")
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
                                        
                                        Text("Settings")
                                            .FontBold(size: 30)
                                    }
                                    
                                    Text("Manage your game preferences")
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
                                            HStack {
                                                Image(.profileItm1)
                                                    .resizable()
                                                    .frame(width: 41, height: 42)
                                                
                                                Text("Your Stats")
                                                    .FontBold(size: 20)
                                                
                                                Spacer()
                                            }
                                            
                                            Spacer()
                                            
                                            VStack(spacing: 20) {
                                                HStack {
                                                    Text("Current Balance:")
                                                        .FontRegular(size: 16, color: .white.opacity(0.6))
                                                    
                                                    Spacer()
                                                    
                                                    Image(.reward)
                                                        .resizable()
                                                        .frame(width: 16, height: 16)
                                                    
                                                    Text("\(settingsModel.coins)")
                                                        .FontSemiBold(size: 16)
                                                }
                                                
                                                HStack {
                                                    Text("Games Played:")
                                                        .FontRegular(size: 16, color: .white.opacity(0.6))
                                                    
                                                    Spacer()
                                                    
                                                    Image(.gamePlayed)
                                                        .resizable()
                                                        .frame(width: 16, height: 16)
                                                    
                                                    Text("\(UserDefaultsManager.shared.getSpinsCount())")
                                                        .FontSemiBold(size: 16)
                                                }
                                                
                                                HStack {
                                                    Text("Total Winnings:")
                                                        .FontRegular(size: 16, color: .white.opacity(0.6))
                                                    
                                                    Spacer()
                                                    
                                                    Image(.cube3)
                                                        .resizable()
                                                        .frame(width: 16, height: 16)
                                                    
                                                    Text("\(UserDefaultsManager.shared.getTotalWinnings())")
                                                        .FontSemiBold(size: 16)
                                                }
                                            }
                                            .padding(.bottom)
                                        }
                                        .padding()
                                    }
                            }
                            .frame(height: 222)
                            .cornerRadius(14)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(.gray, lineWidth: 2)
                                    .overlay {
                                        VStack {
                                            HStack {
                                                Image(.music)
                                                    .resizable()
                                                    .frame(width: 26, height: 25)
                                                
                                                Text("Audio Settings")
                                                    .FontBold(size: 20)
                                                
                                                Spacer()
                                            }
                                            
                                            Spacer()
                                            
                                            HStack {
                                                Image(.sound)
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                
                                                VStack(alignment: .leading) {
                                                    Text("Sound Effects")
                                                        .FontMedium(size: 16)
                                                    
                                                    Text("Enabled")
                                                        .FontRegular(size: 14, color: .white.opacity(0.6))
                                                }
                                                .padding(.leading, 5)
                                                
                                                Spacer()
                                                
                                                Toggle("", isOn: $settingsModel.isOn)
                                                    .toggleStyle(CustomToggleStyle())
                                            }
                                            .padding(.bottom, 10)
                                        }
                                        .padding()
                                    }
                            }
                            .frame(height: 158)
                            .cornerRadius(14)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(.gray, lineWidth: 2)
                                    .overlay {
                                        VStack {
                                            HStack {
                                                Image(.game)
                                                    .resizable()
                                                    .frame(width: 26, height: 25)
                                                
                                                Text("Game Actions")
                                                    .FontBold(size: 20)
                                                
                                                Spacer()
                                            }
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                Button(action: {
                                                    UserDefaultsManager.shared.resetAllButCoins()
                                                    showAlert = true
                                                    NotificationCenter.default.post(name: Notification.Name("UserResourcesUpdated"), object: nil)
                                                    settingsModel.coins =  UserDefaultsManager.shared.getCoins()
                                                }) {
                                                    Rectangle()
                                                        .fill(Color(red: 232/255, green: 0/255, blue: 12/255))
                                                        .overlay {
                                                            HStack {
                                                                Image(systemName: "arrow.triangle.2.circlepath")
                                                                    .foregroundStyle(.white)
                                                                
                                                                Text("Reset Progress")
                                                                    .FontSemiBold(size: 14)
                                                            }
                                                        }
                                                        .frame(height: 36)
                                                        .cornerRadius(8)
                                                }
                                                .alert(isPresented: $showAlert) {
                                                    Alert(
                                                        title: Text("Done"),
                                                        message: Text("All progress are reseted."),
                                                        dismissButton: .default(Text("Ok"))
                                                    )
                                                }
                                                
                                                Text("This will reset all your stats and give you 1,000 free coins")
                                                    .FontRegular(size: 12, color: .white.opacity(0.6))
                                            }
                                        }
                                        .padding()
                                    }
                            }
                            .frame(height: 158)
                            .cornerRadius(14)
                            .padding(.horizontal)
                    }
                    .padding(.top)
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            RoundedRectangle(cornerRadius: 16)
                .fill(configuration.isOn ? .black : Color(red: 69/255, green: 90/255, blue: 109/255))
                .frame(width: 32, height: 18)
                .overlay(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 16, height: 16)
                        .offset(x: configuration.isOn ? 6 : -6)
                        .animation(.easeInOut, value: configuration.isOn)
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

extension View {
    func outlineText(color: Color, width: CGFloat) -> some View {
        modifier(StrokeModifier(strokeSize: width, strokeColor: color))
    }
}

struct StrokeModifier: ViewModifier {
    private let id = UUID()
    var strokeSize: CGFloat = 1
    var strokeColor: Color = .blue
    
    func body(content: Content) -> some View {
        content
            .padding(strokeSize*2)
            .background (Rectangle()
                .foregroundStyle(strokeColor)
                .mask({
                    outline(context: content)
                })
            )}
    
    func outline(context:Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            context.drawLayer { layer in
                if let text = context.resolveSymbol(id: id) {
                    layer.draw(text, at: .init(x: size.width/2, y: size.height/2))
                }
            }
        } symbols: {
            context.tag(id)
                .blur(radius: strokeSize)
        }
    }
}
