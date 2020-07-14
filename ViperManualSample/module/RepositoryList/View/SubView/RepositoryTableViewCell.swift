//
//  RepositoryTableViewCell.swift
//  ViperManualSample
//
//  Created by Yaya Watanabe on 2020/07/12.
//  Copyright © 2020 Yaya Watanabe. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var repositoryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setRepository(_ repository: Repository) {

        repositoryName.text = "\(repository.username)/\(repository.repo.name)"
        
    }
}
