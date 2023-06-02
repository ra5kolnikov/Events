//
//  ReuseableButton.swift
//  Events
//
//  Created by Виталий on 02.06.2023.
//

import SwiftUI

struct ReuseableButton: View {
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
             RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                Text(title)
                    .bold()
                    .foregroundColor(.white)
            }
        }

    }
}

struct ReuseableButton_Previews: PreviewProvider {
    static var previews: some View {
        ReuseableButton(title: "I'm a Button", color: .blue) {
            //Action
        }
    }
}
