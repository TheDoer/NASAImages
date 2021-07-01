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

