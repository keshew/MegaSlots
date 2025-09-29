import SwiftUI

extension Text {
    func FontRegular(size: CGFloat,
                     color: Color = .white)  -> some View {
        self.font(.custom("SFProDisplay--Regular", size: size))
            .foregroundColor(color)
    }
    
    func FontMedium(size: CGFloat,
                    color: Color = .white)  -> some View {
        self.font(.custom("SFProDisplay-Medium", size: size))
            .foregroundColor(color)
    }
    
    func FontSemiBold(size: CGFloat,
                   color: Color = .white)  -> some View {
        self.font(.custom("SFProDisplay-Semibold", size: size))
            .foregroundColor(color)
    }
    
    func FontBold(size: CGFloat,
                   color: Color = .white)  -> some View {
        self.font(.custom("SFProDisplay-Bold", size: size))
            .foregroundColor(color)
    }
}
