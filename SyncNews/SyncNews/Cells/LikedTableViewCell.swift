//
//  LikedTableViewCell.swift
//  SyncNews
//
//  Created by Asude Nisa Tıraş on 17.05.2023.
//

import UIKit

class LikedTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
