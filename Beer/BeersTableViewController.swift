//
//  BeersTableViewController.swift
//  Beer
//
//  Created by Ricardo Tourinho on 19/07/17.
//  Copyright © 2017 Ricardo Tourinho. All rights reserved.
//

import UIKit

class BeersTableViewController: UITableViewController {

    var dataSource: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadBeers()
    }

    func loadBeers() {
        if dataSource.count == 0 {
            REST.loadBeers { (beers: [Beer]?) in
                if let beers = beers {
                    self.dataSource = beers
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerTableViewCell
        
        let beer = dataSource[indexPath.row]
        cell.name.text = beer.name
        if let abv = beer.abv {
            cell.teor.text = "\(abv)"
        }
        if beer.image_view == nil {
            cell.imagem.image = nil
            downloadImage(url: URL(string: beer.image_url!)!, beer: beer, cell: cell)
        } else {
            cell.imagem.image = beer.image_view?.image
        }
        return cell
    }

    func downloadImage(url: URL, beer: Beer, cell: BeerTableViewCell) {
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let _data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() { () -> Void in
                beer.image_view = UIImageView(image: UIImage(data: _data))
                cell.imagem.image = beer.image_view?.image
            }
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "details" {
            let vc = segue.destination as! BeerDetailsViewController
            vc.beer = dataSource[tableView.indexPathForSelectedRow!.row]
        }
    }

}
