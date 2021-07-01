//
//  ViewController.swift
//  NASA App
//
//  Created by Adonis Rumbwere on 25/6/2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    //var apiService = APIService()
    
    private var viewModel = ImagesViewModel()
    private var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        apiService.getImagesData { (result) in
//           print(result)
//       }
        
        
        loadImagesData()
        bindTableData()
    }
    
    func bindTableData(){
        
        //Bind item to table
        ImagesViewModel.items.bind(
            to: tableView.rx.items(
                 cellIdentifier: "cell",
                 cellType: ImagesTableViewCell.self)
          ) { row , item , cell in
            
            //let json = viewModel.cellForAt(indexPath: indexPath)
            //print("JSonData: \(json)")
            //cell.setCellWithValueOf(json)
            

        }.disposed(by: bag)
        


        //Bind a model selected handler
        tableView.rx.modelSelected(Item.self).bind { item in
        }.disposed(by: bag)
           
//
//
        //fetch items
        viewModel.fetchImagesData {
            completion()
        }
        
    }
    
    private func loadImagesData(){
        viewModel.fetchImagesData { [weak self] in
            
            

        }
    }
    
}



//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //return viewModel.numberOfRowsInSection(section: section)
//
//        return 5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImagesTableViewCell
//
//        //let json = viewModel.cellForAt(indexPath: indexPath)
//        //print("JSonData: \(json)")
//        //cell.setCellWithValueOf(json)
//
//
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return 120
//    }
//
//
//}
