//
//  BeerDetailsViewController.swift
//  PUNKBeers
//
//  Created by Ricardo Tourinho on 20/07/17.
//  Copyright © 2017 Ricardo Tourinho. All rights reserved.
//

import UIKit

class BeerDetailsViewController: UIViewController {

    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblTagline: UILabel!
    @IBOutlet weak var tvDescricao: UITextView!
    @IBOutlet weak var lblAbv: UILabel!
    @IBOutlet weak var lblIbu: UILabel!
    @IBOutlet weak var ivFoto: UIImageView!
    
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if beer != nil {
            lblNome.text = beer.name
            lblTagline.text = beer.tagline
            tvDescricao.text = beer.description
            if let abv = beer._abv {
                lblAbv.text = "\(abv)"
            }
            if let ibu = beer.ibu {
                lblIbu.text = "\(ibu)"
            }
            ivFoto.image = beer.image_view?.image
        }
        self.navigationController?.navigationBar.topItem?.title = ""
    }

}
