//
//  ViewController.swift
//  AsyncAwait_APIHandler
//
//  Created by apple  on 08/07/24.
//

import UIKit

class ViewController: UIViewController {

    private lazy var viewModel : ViewModel = {
        return ViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }
    
    @IBAction func hitAPI(_ sender: Any) {
        Task{
            do{
                let parsedData = try await viewModel.fetchData()
                print(parsedData)
            }catch let error{
                print(error)
            }
           
        }
    }
}

extension ViewController{
  
}
