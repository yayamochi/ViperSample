//
//  Repository.swift
//  ViperManualSample
//
//  Created by Yaya Watanabe on 2020/07/12.
//  Copyright © 2020 Yaya Watanabe. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    let username: String
    let name: String
    let url: URL
    let avatar: String
    let repo: RepositoryDetail

    struct RepositoryDetail: Decodable {
        let name: String
        let description: String
        let url: URL
    }
}
