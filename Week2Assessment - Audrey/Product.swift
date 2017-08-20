//
//  Product.swift
//  Week2Assessment - Audrey
//
//  Created by Audrey Lim on 18/08/2017.
//  Copyright © 2017 Audrey Lim. All rights reserved.
//

import Foundation
import UIKit


class Product {
    var name : String = "No Product Name"
    var detail : String = ""
    var image : UIImage = UIImage(named: "unknown") ??
        UIImage()
    var url : String = ""
    

    init() {} //do nothing just initialize
    
    
    init(name : String, detail : String, imageName : String, url : String){
        self.name = name
        self.detail = detail
        if let productImage = UIImage(named: imageName) {
            self.image = productImage
        }
        self.url = url
    }
    
}
