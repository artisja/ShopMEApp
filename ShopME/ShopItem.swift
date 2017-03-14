//
//  ShopItem.swift
//  ShopME
//
//  Created by Artis, Justin (CONT) on 3/2/17.
//  Copyright © 2017 Artis, Justin (CONT). All rights reserved.
//

import Foundation
import UIKit

class ShopItem{
    
    var itemName: String;
    var description: String;
    var price: Double;
    var totalPrice: Double;
    var image: UIImage;
    var quantity: Int;
    
    init(itemString: String,descript: String,priceNum: Double,itemImage: UIImage?) {
        self.itemName = itemString;
        self.description = descript;
        self.price = priceNum;
        self.image = itemImage!;
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
    func quantityChange(choice: Int) -> (newQuantity:Int,newTotals:Double) {
        if choice==1{
        totalPrice = totalPrice + price;
        quantity = quantity +  1;
        }else{
            if totalPrice-price < 0 {
                totalPrice=0
                quantity = 0
            }else{
            totalPrice = totalPrice - price;
            quantity = quantity -  1;
            }
            }
        return (quantity,totalPrice);
}
}
