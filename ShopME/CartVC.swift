//
//  CartVC.swift
//  ShopME
//
//  Created by Artis, Justin (CONT) on 3/4/17.
//  Copyright © 2017 Artis, Justin (CONT). All rights reserved.
//

import UIKit

class CartVC: UIViewController,UITableViewDelegate,UITableViewDataSource{


    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var VCquantityLabel: UILabel!
    @IBOutlet weak var VCpriceLabel: UILabel!
    @IBOutlet weak var VCtotalLabel: UILabel!
    @IBOutlet weak var VCTotalPrice: UILabel!
    @IBOutlet weak var VCTotalQuantity: UILabel!
    @IBOutlet weak var emptyCartButton: UIButton!
    @IBOutlet weak var buyCartButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.dataSource = self
        cartTableView.delegate = self
        cartTableView.reloadData()
        VCpriceLabel.text = "Price"
        VCquantityLabel.text = "Quantity"
        VCTotalQuantity.text = "\(Registry.carts.currentCart.count)"
        VCTotalPrice.text = "\(getTotalPrice())"
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Registry.carts.currentCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CartCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CartTVCell
        var currentItem = Registry.carts.currentCart[indexPath.row].1
        cell?.productName.text = currentItem.getItemName()  //Registry.carts.currentCart[indexPath.section]
        cell?.quantityLabel.text = "\(currentItem.quantity)"
        cell?.totalPriceLabel.text = "\(currentItem.totalPrice)"
        cell?.increaseButton.tag = indexPath.row
        cell?.decreaseButton.tag = indexPath.row
        return cell!
    }
    
    func getTotalPrice() -> Double {
        var totalPrice = 0.0
        for itemList in Registry.carts.currentCart {
                totalPrice = totalPrice + itemList.1.totalPrice
        }
        return totalPrice
    }
    @IBAction func buyCart(_ sender: Any) {
        var currentTime: Date
        currentTime = Date()
        let alert = UIAlertController(title: "PAYMENT", message: "You will be charged \(getTotalPrice())", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let placeOrderAction = UIAlertAction(title:"Place Order",style: .default){
            (UIAlertAction)->() in Registry.carts.addToAllCarts(cartCount: Registry.carts.currentCart.count, purchaseDate: currentTime)
            Registry.carts.currentCart.removeAll()
            self.performSegue(withIdentifier: "unwindHome", sender: self)
        }
        alert.addAction(cancelAction)
        alert.addAction(placeOrderAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func increaseQuantity(_ sender: UIButton) {
      var cartItem =  Registry.carts.currentCart[sender.tag].1
      _ = cartItem.quantityChange(choice: 1)
        cartTableView.reloadData()
    }
    
    @IBAction func emptyCartAction(_ sender: Any) {
    Registry.carts.currentCart.removeAll()
        cartTableView.reloadData()
    }
    
    @IBAction func decreaseQuantity(_ sender: UIButton) {
        var cartItem =  Registry.carts.currentCart[sender.tag].1
        _ = cartItem.quantityChange(choice: -1)
        cartTableView.reloadData()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
