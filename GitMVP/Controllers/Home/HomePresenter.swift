

import Foundation

protocol HomePresenterProtocol {
    var numberOfRepos: Int { get }
    func fetchUserInfo()
    func fetchAllRepos()
    func Repo(at index: Int) -> String
    func selectRepo(at index: Int)
}

class HomePresenter {
    
    weak var view: HomeVeiwProtocol?
    private var repos: [Repo] = []
    let request = GitRequest()

    init(view: HomeVeiwProtocol) {
        self.view = view
    }
}

extension HomePresenter: HomePresenterProtocol {
    
    func Repo(at index: Int) -> String {
        repos[index].name
    }
    
    var numberOfRepos: Int {
        repos.count
    }
    
    func fetchUserInfo() {
        view?.showHud()
        request.retrieveUserInfo { [weak self] user in
            switch user {
            case .success(let user):
                self?.view?.HideHud()
                let url = URL(string: user.avatar)
                self?.view?.configure(url: url!, user: user)
            case .failure(let error):
                self?.view?.HideHud()
                print(error)
            }
        }
    }
    
    func fetchAllRepos() {
        view?.showHud()
        request.retrieveAllRepos({ [weak self] repos in
            switch repos {
            case.success(let repos):
                self?.view?.HideHud()
                self?.repos = repos
            case.failure(let error):
                self?.view?.HideHud()
                print(error)
                
            }
            
            self?.view?.refreshReposTableView()
        })
    }
    
    func selectRepo(at index: Int) {
        let selectedRepo = repos[index]

        let repoDetailsRoute = HomeRoutes.repoDetails(selectedRepo)
        view?.navigate(to: repoDetailsRoute)
    }
}


