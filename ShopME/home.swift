//
//  home.swift
//  ShopME
//
//  Created by Artis, Justin (CONT) on 2/22/17.
//  Copyright © 2017 Artis, Justin (CONT). All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class home: UICollectionViewController {
    

    @IBOutlet var homeCV: UICollectionView!
    var cartCount = 0
    var categoryList = Registry.categories
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        homeCV.delegate = self;
        homeCV.dataSource = self;
        let backscreenImage = UIImage(named: "background-home.png")!
        backscreenImage.draw(in: CGRect.null, blendMode: CGBlendMode.clear, alpha: 0.40)
        homeCV.backgroundColor = UIColor.init(patternImage: backscreenImage);
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let logo = UIImage(named: "logo.png")
        let logoView = UIImageView(image: logo)
        self.navigationItem.titleView = logoView
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartCount = Registry.carts.currentCart.count
        categoryList = Registry.categories
        homeCV.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Registry.categories.count
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Category Cell", for: indexPath) as! CategoryCell
        if(indexPath.row == 1){
            cell.categoryLabel.text = Registry.categories[indexPath.row].getLabelName() + "(\(cartCount))"
        }else{
            cell.categoryLabel.text = Registry.categories[indexPath.row].getLabelName()
        }
        let imageString = UIImage(named: Registry.categories[indexPath.row].getImageName())
        cell.categoryImage.image = imageString
        cell.tag = indexPath.row
        // Configure the cell
        return cell
    }
    
   override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
    let catCell = collectionView.cellForItem(at: indexPath) as! CategoryCell

    if catCell.categoryLabel.text == "Recently Ordered" {
        performSegue(withIdentifier: "recentOrderSegue", sender:catCell)
    } else if Registry.categories[catCell.tag].getLabelName() == "Cart"{
        performSegue(withIdentifier: "cartSegue", sender: catCell)
    } else {
        performSegue(withIdentifier: "itemSegue", sender: catCell)
    }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "recentOrderSegue" {
            let cell = sender as! CategoryCell
            let destination = segue.destination as! recentOrderTVC
            destination.navigationItem.title = cell.categoryLabel.text
        }else if segue.identifier == "cartSegue"{
            let cell = sender as! CategoryCell
            let destination = segue.destination as! CartVC
            destination.navigationItem.title = "Cart"
        }else if(segue.identifier == "manageSegue")
            {
                Registry.carts.addToAllCarts(cartCount: 10, purchaseDate: Date())
//                _ = sender as! CategoryCell
                let destination = segue.destination as! ManagerVC
                destination.navigationItem.title = navigationItem.rightBarButtonItem?.title
        }else{
            let cell = sender as! CategoryCell
            let destination = segue.destination as! ItemTableViewController
            destination.navigationItem.title = cell.categoryLabel.text
            destination.selectedCategory = Registry.allItems.wholeStore[cell.tag]!
            destination.categoryTag = cell.tag
        }
        
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {}

    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
        
    class ShopItem{
        
        var itemName: String;
        var description: String;
        var price: Double;
        var totalPrice: Double;
        var image: UIImage;
        var quantity: Int;
        
        init(itemString: String,descript: String,priceNum: Double,itemImage: UIImage) {
            self.itemName = itemString;
            self.description = descript;
            self.price = priceNum;
            self.image = itemImage;
            totalPrice = 0.0;
            quantity = 0;
        }
        
        //accessor
        func getItemName() -> String {
            return self.itemName;
        }
        
        func getDescription() -> String {
            return self.description;
        }
        
        func getPrice() -> Double {
            return self.price;
        }
        
        func getImage() -> UIImage{
            return self.image
        }
        
        //mutators
        func quantityChange() -> (newQuantity:Int,newTotals:Double) {
            totalPrice = totalPrice + price;
            quantity = quantity +  1;
            return (quantity,totalPrice);
        }
    }

}
