//
//  HomeController.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 15/12/21.
//

import Foundation

protocol HomeControllerDelegate {
    func reloadTableViewData(successCode: Int, data : [Story])
    func displayStoryContent(successCode: Int, data: Story?)
}

class HomeController {
    
    private let storyDB = StoryDB()
    var delegate : HomeControllerDelegate?
    
    #warning ("Create Get All Stories Function")
    func getStories() {
        var data : [Story] = []
        var successCode = 1
        self.storyDB.getStories { querySnapshot, error in
            if let error = error {
                print(error)
                successCode = -1
            } else {
                for document in querySnapshot!.documents {
                    let documentData = document.data()
                    let story = Story(
                        id: document.documentID,
                        title: documentData["title"] as! String,
                        story: documentData["story"] as! String,
                        sender: documentData["sender"] as! String
                    )
                    data.append(story)
                }
            }
            self.delegate?.reloadTableViewData(successCode: successCode, data: data)
        }
    }
    
    #warning ("Create Get Specific Story Function")
    func getStory(id : String) {
        var successCode = 1
        var story : Story?
        self.storyDB.getStory(documentId: id) { (document, error) in
            if error != nil || !document!.exists && document == nil {
                successCode = -1
                story = nil
            } else {
                story = Story(
                    id: document!.documentID,
                    title: document!["title"] as! String,
                    story: document!["story"] as! String,
                    sender: document!["sender"] as! String
                )
            }
            self.delegate?.displayStoryContent(successCode: successCode, data: story ?? nil)
        }
    }
}
