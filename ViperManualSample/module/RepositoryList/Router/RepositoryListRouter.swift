//
//  RepositoryListRouter.swift
//  ViperManualSample
//
//  Created by Yaya Watanabe on 2020/07/11.
//  Copyright © 2020 Yaya Watanabe. All rights reserved.
//
import UIKit


protocol RepositoryListWireframe: AnyObject {
    func showRepositoryDetail(_ repository: Repository)
}


final class RepositoryListRouter {
    
    private unowned let viewController: UIViewController

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

        
    static func assembleModules() -> UIViewController {
        
        let view = StoryboardScene.RepositoryList.initialScene.instantiate()
        let router = RepositoryListRouter(viewController: view)
        let getRepositoryInteractor = GetRepositoryInteractor()

        let presenter = RepositoryListPresenter(view: view,
                                                    router: router,
                                                    getRepositoryInteractor: getRepositoryInteractor)

        view.presenter = presenter 
        
        return view
    }
    
}


extension RepositoryListRouter: RepositoryListWireframe {
    func showRepositoryDetail(_ repository: Repository) {
        let detailView = RepositoryDetailRouter.assembleModulers(repository: repository)
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
}
