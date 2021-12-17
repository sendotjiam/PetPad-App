//
//  StoryDB.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 13/12/21.
//

import Foundation
import FirebaseFirestore

struct StoryDB {
    
    private let db = Firestore.firestore()
    
    func createStory(_ documentData : [String : Any], completion : @escaping (Error?) -> Void) {
        db.collection(Constant.STORY_COLLECTION).addDocument(data: documentData, completion: completion)
    }
    
    func deleteStory(_ documentName : String, completion : @escaping (Error?) -> Void) {
        db.collection(Constant.STORY_COLLECTION).document(documentName).delete(completion: completion)
    }
    
    func getStories(completion : @escaping (FIRQuerySnapshotBlock)) {
        db.collection(Constant.STORY_COLLECTION).getDocuments(completion: completion)
    }
    
    func getStory(documentId : String, completion : @escaping (FIRDocumentSnapshotBlock)) {
        db.collection(Constant.STORY_COLLECTION).document(documentId).getDocument(completion: completion)
    }
}
