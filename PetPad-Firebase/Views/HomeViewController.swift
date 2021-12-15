//
//  ViewController.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 18/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let homeController = HomeController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "StoryCell", bundle: nil), forCellReuseIdentifier: "StoryCell")
        
        homeController.getStories()
//        authenticateCurrentUser()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
//    }
    
//    @objc private func logoutTapped() {
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    
//    private func authenticateCurrentUser() {
//        if Auth.auth().currentUser == nil {
//            DispatchQueue.main.async {
//                let navController = UINavigationController(rootViewController: LoginViewController())
//                navController.navigationBar.barStyle = .black
//                self.present(navController, animated: true, completion: nil)
//            }
//        } else {
//            print(Auth.auth().currentUser!)
//        }
//    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! StoryCell
        return cell
    }
    
    
}

