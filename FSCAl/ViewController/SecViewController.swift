//
//  SecViewController.swift
//  FSCAl
//
//  Created by Admin on 28/06/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class SecViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var rowHeights:[Int:CGFloat] = [:]
    var heroes = [HeroStats]()
    var imagesNames = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
   let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell
        let urlString = heroes[indexPath.row].url
        let url = URL(string: urlString)
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: url!)
            {
                let image: UIImage = UIImage(data: data)!
                cell?.displayImage.image = image
            }
        }
        
        
        cell?.name.text = heroes[indexPath.row].title
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    func downloadJSON(completed: @escaping () -> (Void)) {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                do {
                    self.heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch {
                    print("JSON Error")
                }
            }
            }.resume()
    }
    
}
extension UIImageView {
    func downloadedFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url)
    }
}
