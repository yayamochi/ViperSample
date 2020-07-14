//
//  RepositoryListPresenter.swift
//  ViperManualSample
//
//  Created by Yaya Watanabe on 2020/07/11.
//  Copyright © 2020 Yaya Watanabe. All rights reserved.
//


import Alamofire

protocol RepositoryListViewPresentation: AnyObject {
    func viewDidLoad()
    func fetchTrendingRepositories()
    func didSelectRow(at indexPath: IndexPath)
}


final class RepositoryListPresenter {
    
    private weak var view: RepositoryListView?
    private let router: RepositoryListWireframe
    private let getRepositoryInteractor: GetRepositoryUseCase
    
    init(
        view: RepositoryListView,
        router: RepositoryListWireframe,
        getRepositoryInteractor: GetRepositoryUseCase) {
        self.view = view
        self.router = router
        self.getRepositoryInteractor = getRepositoryInteractor
    }
    
    
    private var repositories: [Repository] = [] {
        didSet {
            view?.updateRepositories(repositories: repositories)
        }
    }
}


extension RepositoryListPresenter: RepositoryListViewPresentation {
    func viewDidLoad() {
    }

    
    func fetchTrendingRepositories() {
        getRepositoryInteractor.fetchTrendingRepositories { [weak self] response in
            switch response.result {
            case .success:
                guard let data = response.data else {
                    return
                }

                do {
                    
                    self?.repositories = try JSONDecoder().decode([Repository].self, from: data)
                } catch let error {
                    print(error)
                }

            case .failure(let error):
                print(error)
            }

        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < repositories.count else {return}
        let repository = repositories[indexPath.row]
        router.showRepositoryDetail(repository)
    }
}
