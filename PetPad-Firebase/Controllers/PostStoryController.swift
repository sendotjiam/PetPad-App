//
//  PostStoryController.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 14/12/21.
//

import Foundation

class PostStoryController {
    
    private let storyDB = StoryDB()
    
    func createNewStory(documentData : [String : Any]) -> Bool{
        var successCode = 1
        self.storyDB.createStory(documentData) { error in
            if let error = error {
                print(error)
                successCode = -1
            }
        }
        return successCode == 1 ? true : false
    }
    
    #warning ("Create Delete Function")
    func deleteStory(documentName : String) -> Bool {
        var successCode = 1
        self.storyDB.deleteStory(documentName) { error in
            if let error = error {
                print(error)
                successCode = -1
            }
        }
        return successCode == 1 ? true : false
    }
    
    #warning ("Create Get Specific Story Function")
    func getStory() -> Any {
        return 0
    }
}
