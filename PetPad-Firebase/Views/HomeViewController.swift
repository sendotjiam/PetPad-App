//
//  ViewController.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 18/10/21.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let homeController = HomeController()
    
    private var storyData : [Story] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateCurrentUser()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "StoryCell", bundle: nil), forCellReuseIdentifier: "StoryCell")
        
        homeController.delegate = self
        homeController.getStories()
//         homeController.getStory(id: "tPcwHVpcWVJR51jTl1Zm")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
    }
    
    @objc private func logoutTapped() {
        try? Auth.auth().signOut()
        self.dismiss(animated: true)
    }
    
    private func authenticateCurrentUser() {
        //        if Auth.auth().currentUser == nil {
        //
        //        } else {
        //            print(Auth.auth().currentUser!)
        //        }
    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! StoryCell
        let content = storyData[indexPath.row]
        cell.setupContent(title: content.title, story: content.story, sender: content.sender)
        return cell
    }
}

extension HomeViewController : HomeControllerDelegate {
    func reloadTableViewData(successCode: Int, data: [Story]) {
        storyData = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func displayStoryContent(successCode: Int, data: Story?) {
        print(data)
    }
}
