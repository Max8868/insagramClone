//
//  MainTabController.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 02/05/22.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        configureNavTabBarColor()
        checkIfUserIsLoggedIn()
//        logout()
    }
    
    // MARK: - API
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginController()
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    func logout() {
        
        do {
            try Auth.auth().signOut()
        } catch {
            print("Debug: Failed to signOut \(error.localizedDescription)")
        }
    }
    
    // MARK: - Helpers
    
    func configureViewControllers() {
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        let feed = templeteNavigationController(unselecteImage: UIImage(named: "home_unselected")!,
                                                selectedImage: UIImage(named: "home_selected")!,
                                                rootViewController: FeedController(collectionViewLayout: layout))
        
        let search = templeteNavigationController(unselecteImage: UIImage(named: "search_unselected")!,
                                                  selectedImage: UIImage(named: "search_selected")!,
                                                  rootViewController: SearchController())
        
        let imageSelector = templeteNavigationController(unselecteImage: UIImage(named: "plus_unselected")!,
                                                         selectedImage: UIImage(named: "plus_unselected")!,
                                                         rootViewController: ImageSelectorController())
        
        let notifications = templeteNavigationController(unselecteImage: UIImage(named: "like_unselected")!,
                                                         selectedImage: UIImage(named: "like_selected")!,
                                                         rootViewController: NotificationsController())
        
        let profile = templeteNavigationController(unselecteImage: UIImage(named: "profile_unselected")!,
                                                   selectedImage: UIImage(named: "profile_selected")!,
                                                   rootViewController: ProfileController())
        
        viewControllers = [feed, search, imageSelector, notifications, profile]
        tabBar.tintColor = .black
        
    }
    
    func templeteNavigationController(unselecteImage: UIImage,
                                      selectedImage: UIImage,
                                      rootViewController: UIViewController) -> UINavigationController {
        
        
        
        let nav = UINavigationController(rootViewController: rootViewController)

        nav.tabBarItem.image = unselecteImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
    
    
    private func configureNavTabBarColor() {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        
        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = UIColor(named: "AccentColor")
            UITabBar.appearance().standardAppearance = tabBarAppearance

            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
    }
}
