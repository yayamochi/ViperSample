//
//  RepositoryListRouter.swift
//  ViperManualSample
//
//  Created by Yaya Watanabe on 2020/07/11.
//  Copyright © 2020 Yaya Watanabe. All rights reserved.
//
import UIKit


protocol RepositoryListWireframe: AnyObject {
    func sample()
}


final class RepositoryListRouter {
    
    private unowned let viewController: UIViewController

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

        
    // DI
    static func assembleModules() -> UIViewController {
        
        let view = StoryboardScene.RepositoryList.initialScene.instantiate()
        let router = RepositoryListRouter(viewController: view)
        let getRepositoryInteractor = GetRepositoryInteractor()

        let presenter = RepositoryListPresenter(view: view,
                                                    router: router,
                                                    getRepositoryInteractor: getRepositoryInteractor)

        view.presenter = presenter    // ViewにPresenterを設定
        
    
        
        return view
    }
    
    
}


extension RepositoryListRouter: RepositoryListWireframe {
    func sample() {
        print("sample")

    }
}
