//
//  RepositoryDetailRouter.swift
//  ViperManualSample
//
//  Created by Yaya Watanabe on 2020/07/14.
//  Copyright © 2020 Yaya Watanabe. All rights reserved.
//


import UIKit

protocol RepositoryDetailWireframe {
    
}

final class RepositoryDetailRouter {
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModulers(repository: Repository) -> UIViewController {
        // この生成方法じゃないとだめっぽい
        let view = StoryboardScene.RepositoryDetail.initialScene.instantiate()
        let router = RepositoryDetailRouter(viewController: view)
        let presenter = RepositoryDetailPresenter(view: view, router: router, repository: repository)
        
        view.presenter = presenter
        return view
    }
}



extension RepositoryDetailRouter: RepositoryDetailWireframe {
    
}
