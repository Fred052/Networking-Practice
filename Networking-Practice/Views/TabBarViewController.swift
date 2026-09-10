//
//  TabBarViewController.swift
//  Networking-Practice
//
//  Created by Ferid Suleymanzade on 05.09.26.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
    }
    
    func configure() {
        let postViewController = PostViewController()
        let postNavigationController = UINavigationController(rootViewController: postViewController)
        postNavigationController.tabBarItem = UITabBarItem(title: "Posts", image: UIImage(systemName: "doc.text"), tag: 0)
        
        let photosViewController = PhotosViewController()
        let photosNavigationController = UINavigationController(rootViewController: photosViewController)
        photosNavigationController.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo"), tag: 1)
        
        let albumsViewController = AlbumsViewController()
        let albumsNavigationController = UINavigationController(rootViewController: albumsViewController)
        albumsNavigationController.tabBarItem = UITabBarItem(title: "Albums", image: UIImage(systemName: "square.stack"), tag: 2)
        
        let usersViewController = UsersViewController()
        let usersNavigationController = UINavigationController(rootViewController: usersViewController)
        usersNavigationController.tabBarItem = UITabBarItem(title: "Users", image: UIImage(systemName: "person.2"), tag: 3)
        
        viewControllers = [postNavigationController, photosNavigationController, albumsNavigationController, usersNavigationController]
    }
}
