//
//  InfoHolder.swift
//  ShopME
//
//  Created by Artis, Justin (CONT) on 3/2/17.
//  Copyright © 2017 Artis, Justin (CONT). All rights reserved.
//

import Foundation
import UIKit

struct Registry {
    static var allItems = Store()
    static var carts = customerCarts()

    static var categories: [CategoryItem] = [
    CategoryItem(image: "category-1-recent",label: "Recently Ordered"),
    CategoryItem(image: "category-2-cart",label: "Cart"),
    CategoryItem(image: "category-3-grocery",label: "Grocery"),
    CategoryItem(image: "category-4-clothing",label: "Clothing"),
    CategoryItem(image: "category-5-movies",label: "Movies"),
    CategoryItem(image: "category-6-garden",label: "Garden"),
    CategoryItem(image: "The_1975_(album)_by_The_1975.png",label: "Music"),
    CategoryItem(image: "category-8-books",label: "Books"),
    CategoryItem(image: "uefa.png",label: "Soccer  "),
    CategoryItem(image: "category-10-toys",label: "Toys")
    ]
    
    static var groceryItems: [ShopItem] =
    [ShopItem(itemString: "Tomatoes",descript: "Tomatoes are Red.",priceNum: 1.50,itemImage: UIImage(named: "grocery-1-tomatoes.png")!
    ),ShopItem(itemString: "Bananas",descript: "Bananas are Yellow.",priceNum: 0.70,itemImage: UIImage(named: "grocery-2-bananas.png")!),ShopItem(itemString: "Gala",descript: "What are Gala?",priceNum: 3.00,itemImage: UIImage(named: "grocery-3-gala.jpg")!),ShopItem(itemString: "Lettuce",descript: "Lettuce is green.",priceNum: 1.85,itemImage: UIImage(named: "grocery-4-lettuce.png")!), ShopItem(itemString: "broccoli", descript: "Broccoli is green.", priceNum: 1.32, itemImage: UIImage(named: "grocery-5-broccoli.png")!)]
    
    static var sportItems: [ShopItem] = [
    ShopItem(itemString: "Reus",descript: "Borussia Dortmund,LW",priceNum: 17.10,itemImage: UIImage(named: "BorussiaDortmundlogo.png")!),
    ShopItem(itemString: "Robben",descript: "Bayern Munich,RW",priceNum: 30.00,itemImage: UIImage(named: "fc_bayern_munchen.svg (1).png")!),
   ShopItem(itemString: "Hazard",descript: "Chelsea, LW",priceNum: 33.00,itemImage: UIImage(named: "chelsea.img.png")!),ShopItem(itemString: "Lindelof",descript: "SL Benefica, CB",priceNum: 1.50,itemImage: UIImage(named: "SL_Benfica_logo.svg.png")!),
   ShopItem(itemString: "Sane", descript: "Manchester City, LW", priceNum: 40.00, itemImage: UIImage(named: "ManchesterCityFC.png")!)]
    
    static var movieItems: [ShopItem] =
    [
    ShopItem(itemString: "Shawshank Redemption",descript: "Drama film/Thriller",priceNum: 16.15,itemImage: UIImage(named: "movies-1-shawshank.jpg")!),
    ShopItem(itemString: "Lord of the Rings",descript: "Fantasy/Action",priceNum: 15.14,itemImage: UIImage(named: "movies-2-lord-of-the-rings.jpg")!),
    ShopItem(itemString: "The Godfather",descript: "Drama film/Drama",priceNum: 12.50,itemImage: UIImage(named: "movies-3-godfather.jpg")!),
    ShopItem(itemString: "Avatar",descript: "Fantasy/Science fiction film",priceNum: 11.50,itemImage: UIImage(named: "movies-4-avatar.jpeg")!),
    ShopItem(itemString: "The Lego Movie", descript: "Fantasy/Adventure", priceNum: 15.00, itemImage: UIImage(named: "movies-5-legomovie.jpg")!)
    ]
    
    static var bookItems: [ShopItem] =
        [
            ShopItem(itemString: "Lighting Theif",descript: "1st Book",priceNum: 1.35,itemImage: UIImage(named: "1stEdition.jpg")!),
            ShopItem(itemString: "Throne of Fire",descript: "New book Series",priceNum: 1.14,itemImage: UIImage(named: "throneFire.jpg")!),
            ShopItem(itemString: "Apollo",descript: "2nd Book,New Series",priceNum: 12.56,itemImage: UIImage(named: "TrailsApollo.jpg")!),
            ShopItem(itemString: "Trials of Apollo",descript: "Apollo Trials start",priceNum: 15.58,itemImage: UIImage(named: "TrailsApollo.jpg")!),
            ShopItem(itemString: "Lighting Theif", descript: "2nd Edition", priceNum: 40.99, itemImage: UIImage(named: "2ndEdition.jpg")!)
    ]

    static var clothingItems: [ShopItem] =
        [
            ShopItem(itemString: "Socks",descript: "Red Socks",priceNum: 12.35,itemImage: UIImage(named: "socks.jpg")!),
            ShopItem(itemString: "Gloves",descript: "Black Gloves",priceNum: 16.14,itemImage: UIImage(named: "gloves.jpeg")!),
            ShopItem(itemString: "Hat",descript: "A Nice Hat",priceNum: 23.66,itemImage: UIImage(named: "hat.jpg")!),
            ShopItem(itemString: "Scarf",descript: "Dark Blue Scarf",priceNum: 15.58,itemImage: UIImage(named: "scarf.jpg")!),
            ShopItem(itemString: "Jeans", descript: "Blue Jeans", priceNum: 53.99, itemImage: UIImage(named: "jeans.jpg")!)
    ]
    
    static var musicItems: [ShopItem] =
        [
        ShopItem(itemString: "Settle Down",descript: "the1975",priceNum: 1.15,itemImage: UIImage(named: "The_1975_(album)_by_The_1975.png")!),
        ShopItem(itemString: "Ugh",descript: "I like it when you sleep because your so beatiful but yet so unaware of it",priceNum: 1.14,itemImage: UIImage(named: "The_1975_-_I_Like_It_When_You_Sleep,_for_You_Are_So_Beautiful_Yet_So_Unaware_of_It.png")!),
        ShopItem(itemString: "Chocolate",descript: "the1975",priceNum: 1.08,itemImage: UIImage(named: "The_1975_(album)_by_The_1975.png")!),
        ShopItem(itemString: "The Sound",descript: "I like it when you sleep because your so beatiful but yet so unaware of it",priceNum: 1.58,itemImage: UIImage(named: "The_1975_-_I_Like_It_When_You_Sleep,_for_You_Are_So_Beautiful_Yet_So_Unaware_of_It.png")!),
        ShopItem(itemString: "Pressure", descript: "the1975", priceNum: 40.99, itemImage: UIImage(named: "The_1975_(album)_by_The_1975.png")!)
    ]
    
    
    
    static var gardenItems: [ShopItem] =
    [
    ShopItem(itemString: "Shovel",descript: "Steel prime shovel",priceNum: 31.98,itemImage: UIImage(named: "garden-1-shovel.png")!),
    ShopItem(itemString: "Tomato Plant",descript: "A plant Tomato type.",priceNum: 25.14,itemImage: UIImage(named: "garden-2-tomato-plant.png")!),
    ShopItem(itemString: "Mower",descript: "A machine that mows",priceNum: 57.38,itemImage: UIImage(named: "garden-3-mower.png")!),
    ShopItem(itemString: "Garden Soil",descript: "Prime 112 Soil",priceNum: 2.50,itemImage: UIImage(named: "garden-4-garden-soil.png")!),
    ShopItem(itemString: "Fruit Tree", descript: "A tree of fruit.", priceNum: 62.23, itemImage: UIImage(named: "garden-5-fruit-tree.png")!)
    ]
    
    
    static var toyItems: [ShopItem] =
    [
    ShopItem(itemString: "Legos",descript: "Toy blocks to build",priceNum: 48.15,itemImage: UIImage(named: "toys-1-lego.jpg")!),
    ShopItem(itemString: "Mario Cart",descript: "Mario Cart Game",priceNum: 17.14,itemImage: UIImage(named: "toys-2-carts.jpg")!),
    ShopItem(itemString: "Potato Head",descript: "Mr.Potato Head figure",priceNum: 8.50,itemImage: UIImage(named: "toys-3-potato-head.jpg")!),
    ShopItem(itemString: "Thomas the Train",descript: "Thomas Train Set",priceNum: 2.50,itemImage: UIImage(named: "toys-4-thomas.jpg")!),
    ShopItem(itemString: "Poke Figure", descript: "Random Pokemon", priceNum: 12.34, itemImage: UIImage(named: "toys-5-poke.png")!)
    ]
    
    
}
