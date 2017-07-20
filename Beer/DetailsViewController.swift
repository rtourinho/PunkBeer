//
//  DetailsViewController.swift
//  PUNKBeers
//
//  Created by Ricardo Tourinho on 20/07/17.
//  Copyright © 2017 Ricardo Tourinho. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
 
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if beer != nil {
            //name.text = beer.name
            //tagline.text = beer.tagline
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
