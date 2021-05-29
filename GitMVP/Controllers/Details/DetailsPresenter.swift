//
//  DetailsPresenter.swift
//  GitMVP
//
//  Created by Mahmoud Aziz on 29/05/2021.
//

import Foundation

protocol DetailsPresenterProtocol {
    var repoName: String { get }
    var startCount: Int { get }
}

class DetailsPresenter: DetailsPresenterProtocol {
    
    weak var view: DetailsViewProtocol?
    private var repo: Repo
    
    init(view: DetailsViewProtocol, repo: Repo) {
        self.view = view
        self.repo = repo
    }
    
    var repoName: String {
        repo.name
    }
    
    var startCount: Int {
        repo.starsCount
    }
}


