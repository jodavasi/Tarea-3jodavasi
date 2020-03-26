//
//  ProductViewController.swift
//  Tarea#3
//
//  Created by MAC on 3/25/20.
//  Copyright © 2020 jodavasi`. All rights reserved.
//

import UIKit

class ProductViewController: UITableViewController {

    var products: Product?
    
    
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelQuantity: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = products?.name
        labelQuantity.text = products?.quantity
        labelDate.text = products?.date.getFormatterd(dateStyle: .short, timeStyle: .long)
        imageProduct.image = UIImage(named: products!.imageName)
        
        

        
    }
    

}
