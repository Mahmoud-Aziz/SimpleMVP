//
//  HomeTableViewCell.swift
//  GitMVP
//
//  Created by Mahmoud Aziz on 29/05/2021.
//

import UIKit

class ReposHomeTableViewCell: UITableViewCell {

    @IBOutlet private weak var repoName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureCell(repo:String) {
        repoName.text = repo
    }
    
}
