//
//  RootRouter.swift
//  ViperManualSample
//
//  Created by Yaya Watanabe on 2020/07/11.
//  Copyright © 2020 Yaya Watanabe. All rights reserved.
//

import UIKit

class RootRouter {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showFirstView() -> UINavigationController {
        let firstView = RepositoryListRouter.assembleModules()
        
        let navigationController = UINavigationController(rootViewController: firstView)
        
       return navigationController

    }
}
