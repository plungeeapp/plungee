//
//  DatabaseManager.swift
//  plungee
//
//  Created by Tobias on 06/07/2024.
//

import Foundation
import FirebaseFirestore

class DatabaseManager: ObservableObject {
    static let shared = DatabaseManager()
    
    let db = Firestore.firestore()
    
    func saveSessionToDB(session: Session) async throws {
        try db.collection("sessions").document(session.id.uuidString).setData(from: session)
    }
    
    func fetchSessionData() async throws -> [Session] {
        let querySnapshot = try await db.collection("sessions").getDocuments()
        let sessions: [Session] = try querySnapshot.documents.compactMap { document in
            try document.data(as: Session.self)
        }
        return sessions
    }
    
    
    func saveNewUser(user: User) async throws {
        try db.collection("users").document(user.id).setData(from: user)
    }
}
