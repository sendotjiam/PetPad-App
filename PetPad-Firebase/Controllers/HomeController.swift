//
//  HomeController.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 15/12/21.
//

import Foundation

class HomeController {
    
    private let storyDB = StoryDB()
    
    #warning ("Create Get All Stories Function")
    func getStories() -> [Any] {
        var successCode = 1
        self.storyDB.getStories { querySnapshot, error in
            if let error = error {
                print(error)
                successCode = -1
            } else {
                for document in querySnapshot!.documents {
                    print(document.data())
                }
            }
        }
        return []
    }
    
}
