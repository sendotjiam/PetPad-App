//
//  HomeController.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 15/12/21.
//

import Foundation

protocol HomeControllerDelegate {
    func reloadTableViewData(successCode: Int, data : [[String: Any]])
}

class HomeController {
    
    private let storyDB = StoryDB()
    var delegate : HomeControllerDelegate?
    
    #warning ("Create Get All Stories Function")
    func getStories() {
        var data : [[String: Any]] = []
        var successCode = 1
        self.storyDB.getStories { querySnapshot, error in
            if let error = error {
                print(error)
                successCode = -1
            } else {
                for document in querySnapshot!.documents {
                    data.append(document.data())
                }
            }
            self.delegate?.reloadTableViewData(successCode: successCode, data: data)
        }
    }
    
}
