//
//  HomeViewController.swift
//  GitMVP
//
//  Created by Mahmoud Aziz on 29/05/2021.
//

import UIKit
import Kingfisher
import JGProgressHUD

protocol HomeVeiwProtocol: AnyObject, NavigationRoute  {
    func refreshReposTableView()
    func configure(url: URL, user: User)
    func showHud()
    func HideHud()
}

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var reposTableView: UITableView!
    var presenter: HomePresenterProtocol?
    let hud = JGProgressHUD(style: .dark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = HomePresenter(view: self)
        registerCell()
        reposTableView.dataSource = self
        reposTableView.delegate = self
        presenter?.fetchUserInfo()
        presenter?.fetchAllRepos()
        
    }
    
    func configure(url: URL, user: User) {
        self.avatarImageView.kf.setImage(with: url)
        self.nameLabel.text = user.name
    }
    
    
    private func registerCell() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        reposTableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
    }
}

extension HomeViewController: HomeVeiwProtocol {
    func refreshReposTableView() {
        reposTableView.reloadData()
    }
    
    func showHud() {
        hud.show(in: view)
    }
    
    func HideHud() {
        hud.dismiss()
    }
}

//MARK:- TableView Datasource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter!.numberOfRepos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! ReposHomeTableViewCell
        let repo = (presenter?.Repo(at: indexPath.row))!
        cell.configureCell(repo: repo)
        return cell
    }
}

//MARK:- TableView Delegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectRepo(at: indexPath.row)
    }
    
    
}




