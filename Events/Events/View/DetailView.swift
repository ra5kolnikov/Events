//
//  DetailView.swift
//  Events
//
//  Created by Виталий on 05.06.2023.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "http://www.Google.com")
    }
}
