//
//  ProductCell.swift
//  Tarea#3
//
//  Created by MAC on 3/25/20.
//  Copyright © 2020 jodavasi`. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
	
    
    @IBOutlet weak var imageProduct: UIImageView!
    
    @IBOutlet weak var nameProduct: UILabel!
    
    
    func setupCell(product: Product) {
        nameProduct.text = product.name
        imageProduct.image = UIImage(named: product.imageName)
    }
}
