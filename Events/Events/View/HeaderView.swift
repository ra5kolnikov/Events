//
//  HeaderView.swift
//  Events
//
//  Created by Виталий on 02.06.2023.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let subtitleSize: CGFloat
    let angle: Double
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
                .frame(width: 270, height: 270)
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: subtitleSize))
                    .foregroundColor(.white)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "SubTitle",subtitleSize: 30, angle: 45, backgroundColor: .blue)
    }
}
