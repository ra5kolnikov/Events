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
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
