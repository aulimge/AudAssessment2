//
//  ViewController.swift
//  Week2Assessment - Audrey
//
//  Created by Audrey Lim on 18/08/2017.
//  Copyright © 2017 Audrey Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView1: UITableView!
    
      
    var products : [Product] = []
    
    var passProductName : String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // view.delegate = self
        
        
        //tableView1.dataSource = self
        tableView1.dataSource = self
        tableView1.delegate = self
        
        let appleTV = Product(name: "Apple TV (4th generation)", detail: "October 26", imageName: "AppleTV", url: "https://en.wikipedia.org/wiki/Apple_TV")
        products.append(appleTV)
        
        let ipadPro = Product(name: "iPad Pro", detail: "June 5", imageName: "IpadPro", url: "https://en.wikipedia.org/wiki/IPad_Pro")
        products.append(ipadPro)
        
        let iphone6 = Product(name: "iPhone 6", detail: "September 16", imageName: "IPhone6", url: "https://en.wikipedia.org/wiki/IPhone_6")
        products.append(iphone6)
        
        let appleWatch = Product(name: "Apple Watch", detail: "April 24", imageName: "AppleWatch", url: "https://en.wikipedia.org/wiki/Apple_Watch")
        products.append(appleWatch)
        
        let macBook = Product(name: "MacBook 12inch", detail: "April 10", imageName: "MacBook", url: "https://en.wikipedia.org/wiki/MacBook")
        products.append(macBook)
        
        tableView1.reloadData()
        
        //set the Navigation Title to product name
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView1.reloadData()
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.Get the Cell
        //  let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductTableViewCell
            else { return UITableViewCell()}
        
        
        // 2. Setup
        let product = products[indexPath.row]
        
        cell.productNameLabel.text = product.name
        cell.productLaunchDateLabel.text = product.detail
        cell.productImage.image = product.image
        
        
        //3. return the cell
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.row]
        
        //navigate to next VC
        //1. get the storyboard
        let mainStoryBoard = UIStoryboard(name: "Main", bundle:Bundle.main)
        //2. get the vc by indetifier, and setup
        guard let destination = mainStoryBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
            else {return}
        
        destination.product = selectedProduct
        destination.delegate = self   ///tap on Edit Button
        
        //3. present it
        // present(destination, animated: true, completion: nil)
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
    
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension ViewController : DidTapOnBackButtonDelegate {
    func didTapOnBackButton(data : String) {
         self.title = data    }


}


