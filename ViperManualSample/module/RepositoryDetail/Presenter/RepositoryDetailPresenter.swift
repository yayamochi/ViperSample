//
//  RepositoryDetailPresenter.swift
//  ViperManualSample
//
//  Created by Yaya Watanabe on 2020/07/14.
//  Copyright © 2020 Yaya Watanabe. All rights reserved.
//

import Foundation


protocol RepositoryDetailPresentation: class {
    func viewDidLoad()
}


final class RepositoryDetailPresenter {
    
    // viewは循環参照にならないようにweak
    private weak var view: RepositoryDetailView?
    private let router: RepositoryDetailWireframe
    private let repository: Repository
    
    init(view: RepositoryDetailView,
         router: RepositoryDetailWireframe,
         repository: Repository) {
        self.view = view
        self.router = router
        self.repository = repository
    }
}


extension RepositoryDetailPresenter: RepositoryDetailPresentation {
    func viewDidLoad() {
        print(repository.repo.url)
        view?.load(request: URLRequest(url: repository.repo.url))
    }
    
}
