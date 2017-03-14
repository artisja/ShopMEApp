//
//  customerCarts.swift
//  ShopME
//
//  Created by Artis, Justin (CONT) on 3/3/17.
//  Copyright © 2017 Artis, Justin (CONT). All rights reserved.
//

import Foundation


class customerCarts
{
    var allCarts = [(Int,String,Date)]()
    var currentCart = [(Int,ShopItem)]()
    var currCartSect = [Int]();
    init() {
        
    }
    
    //iterate throu array of tuples looking for matching index numbers?
    func addToCurrentCart(category:Int,item: ShopItem) -> Void {
        currentCart.append((category,item))
        if !currCartSect.contains(category) {
            currCartSect.append(category)
        }
        
    }
    
    func addToAllCarts(cartCount: Int, purchaseDate: Date) -> Void {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a 'on' MMMM dd, yyyy"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        let newDate = formatter.string(from: purchaseDate)
        allCarts.insert((cartCount,newDate,purchaseDate),at: 0)
    }
    
    func sortAllCart() -> Void {
        allCarts.sort(by: {$0.2.compare($1.2) == .orderedAscending})
    }
    func newCart() -> Void {
        currentCart.removeAll()
    }
    func removeACart(index: Int) -> Void {
        allCarts.remove(at: index)
    }
    
    
}
