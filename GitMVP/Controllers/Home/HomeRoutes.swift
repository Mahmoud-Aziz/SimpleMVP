//
//  HomeRoutes.swift
//  GitMVP
//
//  Created by Mahmoud Aziz on 29/05/2021.
//

import Foundation
import UIKit

enum HomeRoutes: Route {
    case repoDetails(Repo)

    var destination: UIViewController {
        switch self {
        case .repoDetails(let repo):
           
            let repoDetailsViewController = DetailsViewController(nibName: "DetailsViewController", bundle: nil)

            repoDetailsViewController.presenter = DetailsPresenter(view: DetailsViewController(), repo: repo)
            return repoDetailsViewController
        }
    }

    var style: NaivgationStyle {
        switch self {
        case .repoDetails:
            return .modal
        }
    }
}
