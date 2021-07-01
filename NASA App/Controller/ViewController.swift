//
//  ViewController.swift
//  NASA App
//
//  Created by Adonis Rumbwere on 25/6/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    //var apiService = APIService()
    
    private var viewModel = ImagesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        apiService.getImagesData { (result) in
//           print(result)
//       }
        
        loadImagesData()
    }
    
    private func loadImagesData(){
        viewModel.fetchImagesData { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImagesTableViewCell
        
        let json = viewModel.cellForAt(indexPath: indexPath)
        print("JSonData: \(json)")
        cell.setCellWithValueOf(<#Data#>)
        
        return cell
    }
    
    
}
