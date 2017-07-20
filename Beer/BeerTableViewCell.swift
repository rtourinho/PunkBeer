//
//  BeerTableViewCell.swift
//  PUNKBeers
//
//  Created by Ricardo Tourinho on 20/07/17.
//  Copyright © 2017 Ricardo Tourinho. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {


    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var teor: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
