//
//  FeedController.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 02/05/22.
//

import UIKit
import Firebase
private let reuseIdentifier = "Cell"

class FeedController: UICollectionViewController {
    
    // MARK: - Lifecycle
    private var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchPosts()
    }
    
    // MARK: - Actions
    
    @objc private func handleLogout(sender: UIButton) {
        do {
            try Auth.auth().signOut()
            let controller = LoginController()
            controller.delegate = self.tabBarController as? MainTabController
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        } catch {
            print("Debug: Failed to signOut \(error.localizedDescription)")
        }
    }
    
    @objc
    private func handleRefresh(sender: UIRefreshControl) {
        posts.removeAll()
        fetchPosts()
    }
    
    // MARK: - API
    func fetchPosts() {
        PostService.fetchPosts { posts in
            self.posts = posts
            self.collectionView.refreshControl?.endRefreshing()
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - Helpers

    func configureUI() {
        collectionView.backgroundColor = .white
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(handleLogout(sender:)))
        navigationItem.title = "Feed"
        
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRefresh(sender:)), for: .valueChanged)
        collectionView.refreshControl = refresher
    }
    
}

// MARK: - UICollectionViewDataSource

extension FeedController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
        cell.viewModel = PostViewModel(posts: posts[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        let height = width + 166
        return CGSize(width: width, height: height)
    }
}
