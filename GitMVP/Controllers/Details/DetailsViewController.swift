//
//  DetailsViewController.swift
//  GitMVP
//
//  Created by Mahmoud Aziz on 29/05/2021.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    
}

class DetailsViewController: UIViewController {

    @IBOutlet private weak var repoNameLabel: UILabel!
    @IBOutlet private weak var startCountLabel: UILabel!
    
    var presenter: DetailsPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.repoNameLabel.text = presenter?.repoName
        let count = String(presenter!.startCount)
        self.startCountLabel.text = count
    }
}

extension DetailsViewController: DetailsViewProtocol {
    
}
