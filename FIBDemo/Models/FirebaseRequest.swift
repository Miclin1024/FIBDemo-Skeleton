//
//  FirebaseRequest.swift
//  FIBDemo
//
//  Created by Michael Lin on 10/3/20.
//

import Foundation
import Firebase

class FirebaseRequest {
    
    static let shared = FirebaseRequest()
    
    enum FIBAuthError: Error {
        case emptyEmail, emptyPassword
        case malformedEmail, malformedPassword
        case rejectedCredential, networkError
        case generalError
    }
    
    enum FIBRegisError: Error {
        case emailInUse
        case generalError
    }
    
    private func getReference(forCollection collection: FIBCollection) -> CollectionReference {
        let db = Firestore.firestore()
        return db.collection(collection.rawValue)
    }
    
    private enum FIBCollection: String {
        case userInfo
    }
}
