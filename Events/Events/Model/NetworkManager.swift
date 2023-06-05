//
//  NetworkManager.swift
//  Events
//
//  Created by Виталий on 05.06.2023.
//

import Foundation
import SwiftUI

class NetworkManager: ObservableObject {
    
    @Published var posts = [EventItem]()
    
    func fetchData() {
        
        if let url = URL(string: "https://kontests.net/api/v1/all") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
