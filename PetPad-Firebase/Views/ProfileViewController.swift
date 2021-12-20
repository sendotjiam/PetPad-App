//
//  ProfileViewController.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 20/12/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private let homeController = HomeController()
    
    private var myStory : [Story] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "StoryCell", bundle: nil), forCellReuseIdentifier: "StoryCell")
        
        homeController.delegate = self
        homeController.getStories()
    }
}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! StoryCell
        return cell
    }
}

extension ProfileViewController : HomeControllerDelegate {
    func reloadTableViewData(successCode: Int, data: [Story]) {
        myStory = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func displayStoryContent(successCode: Int, data: Story?) {
        print(data)
    }
}
