//
//  FirstView.swift
//  Tarea#3
//
//  Created by MAC on 3/24/20.
//  Copyright © 2020 jodavasi`. All rights reserved.
//

import UIKit

class FirstView: UIViewController {

    @IBOutlet weak var tableViewList: UITableView!
    
    
    let productCellIndentifier = "ProductCell"
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        addNewNavigationButton()

       
    }
    
    func registerCell(){
        let nib = UINib(nibName: productCellIndentifier, bundle: nil)
        tableViewList.register(nib, forCellReuseIdentifier: productCellIndentifier)
        
    }
    
    func addNewNavigationButton(){
        let addNavButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewsAction(sender:)))
        navigationItem.rightBarButtonItem = addNavButton
        
    }
    
    @objc func addNewsAction(sender: UIBarButtonItem){
        
        if let createViewController = storyboard?.instantiateViewController(identifier: "CreateViewController") as? CreateViewController{
            createViewController.delegate = self
        navigationController?.pushViewController(createViewController, animated: true)
            
        }
        
    }
    
    
    

    

}
extension FirstView: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: productCellIndentifier)  as? ProductCell else {
            let cell = UITableViewCell()
            return cell
        }
        cell.setupCell(product: products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "ProductViewController") as? ProductViewController {
            viewController.products = products[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}

extension FirstView: addNewProductProtocol{
    
    func addNew(product: Product) {
        products.append(product)
        navigationController?.popViewController(animated: true)
        tableViewList.reloadData()
    }
}
