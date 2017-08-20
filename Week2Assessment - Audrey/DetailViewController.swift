//
//  DetailViewController.swift
//  Week2Assessment - Audrey
//
//  Created by Audrey Lim on 18/08/2017.
//  Copyright © 2017 Audrey Lim. All rights reserved.
//

import UIKit



class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var productNameLabel: UITextField!
    @IBOutlet weak var productLaunchDateLabel: UITextField!
    @IBOutlet weak var productImage: UIImageView!
    
    
    var product : Product = Product()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // self.navigationController!.navigationBar.topItem!.title = "Apple Products"
       
        
        productNameLabel.text = product.name
        productLaunchDateLabel.text = product.detail
        productImage.image = product.image
        
        //disable Editing
        productNameLabel.isEnabled = false
        productLaunchDateLabel.isEnabled = false
       
        //hide
        productNameLabel.isHidden = true
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DetailViewController.editButtonPressed))
        
        self.title = productNameLabel.text
        
        
    }


    

    @IBAction func buttonWiki(_ sender: Any) {
        print("Open Wiki from Detail to Web")
        performSegue(withIdentifier: "sequeWeb", sender: self)
    }
    
    
    @IBAction func buttonChangeTitle(_ sender: Any) {
       let currProdName = productNameLabel.text
       self.title = currProdName
    
    }
   
    func editButtonPressed(){

        if navigationItem.rightBarButtonItem?.title == "Edit" {
            
           navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DetailViewController.editButtonPressed))
             //Enable Editing
             productNameLabel.isEnabled = true
             productLaunchDateLabel.isEnabled = true
        
            //Unhide
            productNameLabel.isHidden = false
        
       } else{
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DetailViewController.editButtonPressed))
            
            //Enable Editing
            productNameLabel.isEnabled = false
            productLaunchDateLabel.isEnabled = false
            
            //hide
            productNameLabel.isHidden = true
        }
    } //end editButtonPressed

    

    
    override func viewWillDisappear(_ animated: Bool) {

        product.name = productNameLabel.text!
        product.detail = productLaunchDateLabel.text!
        //        }
        
    
        
        super.viewWillDisappear(true)
        
        
    }

    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard let destination = segue.destination as?
            WebViewController
            else {return}
        
        destination.productURLString = product.url
        
        
    }
    

}
