//
//  CreateViewController.swift
//  Tarea#3
//
//  Created by MAC on 3/25/20.
//  Copyright © 2020 jodavasi`. All rights reserved.
//

import UIKit

protocol addNewProductProtocol : class {
    func addNew(product:Product)
}

class CreateViewController: UITableViewController {

    @IBOutlet weak var nameProducto: UITextField!
    @IBOutlet weak var quantityProduct: UITextField!
    
    weak var delegate: addNewProductProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewNavigationButton()

        // Do any additional setup after loading the view.
    }
    
    func addNewNavigationButton(){
        let addNavButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addNewsAction(sender:)))
        navigationItem.rightBarButtonItem = addNavButton
        
    }
    @objc func addNewsAction(sender: UIBarButtonItem){
        let randomNumber = Int.random(in: 1...5)
        if let title = nameProducto.text, quantityProduct.text!.count > 0, title.count > 0{
            let newProduct = Product(name: nameProducto.text!, quantity: quantityProduct.text!, imageName: "product"+String(randomNumber))
            delegate?.addNew(product: newProduct)
        }else{
            let alertController = UIAlertController(title: "Error", message: "Debe llenar todos los espacios", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController,animated: true,completion: nil)
        }
        
     }
    
    
    
    
    

    

}
