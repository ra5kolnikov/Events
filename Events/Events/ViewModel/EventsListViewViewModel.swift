//
//  EventsListViewViewModel.swift
//  Events
//
//  Created by Виталий on 02.06.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class EventsListViewViewModel: ObservableObject {
    
    @Published var showAlert = false
    @Published var userName = ""
    @Published var posts = [EventItem]()
    
    init() {}
    
    func fetchUser() {
        
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(userID).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.userName = data["name"] as? String ?? ""
            }
        }
    }
    
    func fetchData() {
        
        if let url = URL(string: "https://kontests.net/api/v1/all") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    if let safeData = data {
                        do {
                            let results: [EventItem] = try decoder.decode([EventItem].self, from: safeData)
                            DispatchQueue.main.async { [self] in
                                for i in 0...results.count - 1 {
                                    posts.append(results[i])
                                    posts[i].id = UUID().uuidString
                                    posts[i].start_time = formattedDate(date: results[i].start_time)
                                    posts[i].end_time = formattedDate(date: results[i].end_time)
                                }
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
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
